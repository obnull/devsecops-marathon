#!/usr/bin/env python3
"""
Day 119: Security permission checker.
Validates Linux file permissions against security policies.
"""

def parse_permission_mode(mode: int) -> str:
    """Convert octal mode to rwx string (simplified)."""
    # В реальности используем os.stat(), здесь — демонстрация логики
    perms = {
        0o644: "rw-r--r--",
        0o600: "rw-------",
        0o755: "rwxr-xr-x",
        0o400: "r--------",
        0o777: "rwxrwxrwx",
    }
    return perms.get(mode, "unknown")


def check_file_security(filename: str, mode: int, owner: str, contains_secrets: bool) -> list:
    """Check file against security best practices. Returns list of violations."""
    violations = []
    
    # Правило 1: Секретные файлы не должны быть читаемы группой/другими
    if contains_secrets:
        if mode & 0o070:  # Проверка group/other битов
            violations.append("SECRETS FILE is readable by group or others!")
        if mode & 0o007:
            violations.append("SECRETS FILE is readable by others!")
    
    # Правило 2: Исполняемые файлы должны быть 755 максимум
    if mode & 0o111:  # Если есть execute-биты
        if mode & 0o022:  # Если group/other могут писать
            violations.append("EXECUTABLE is writable by group/other!")
    
    # Правило 3: Никакой файл не должен быть 777
    if mode == 0o777:
        violations.append("CRITICAL: World-writable file (777)!")
    
    # Правило 4: Ключевые конфиги должны быть только owner-writable
    if "config" in filename.lower() or "conf" in filename.lower():
        if mode & 0o022:  # Проверка на writable для group/other
            violations.append("CONFIG is group-writable or other-writable!")
    
    return violations


def main():
    # Имитация файлов с их правами (как будто прочитали ls -l)
    files = [
        {"name": "id_rsa", "mode": 0o600, "owner": "devops", "secrets": True},
        {"name": "deploy.sh", "mode": 0o755, "owner": "devops", "secrets": False},
        {"name": "nginx.conf", "mode": 0o644, "owner": "root", "secrets": False},
        {"name": ".env", "mode": 0o644, "owner": "devops", "secrets": True},
        {"name": "script.sh", "mode": 0o777, "owner": "devops", "secrets": False},
        {"name": "database.yml", "mode": 0o664, "owner": "devops", "secrets": True},
    ]
    
    print("=" * 60)
    print(" FILE PERMISSION SECURITY AUDIT")
    print("=" * 60)
    
    total_violations = 0
    
    for file_info in files:
        name = file_info["name"]
        mode = file_info["mode"]
        owner = file_info["owner"]
        has_secrets = file_info["secrets"]
        
        perm_str = parse_permission_mode(mode)
        violations = check_file_security(name, mode, owner, has_secrets)
        
        # Вывод
        secret_tag = " " if has_secrets else ""
        print(f"\n {name}{secret_tag} ({perm_str})")
        print(f"   Owner: {owner}")
        
        if violations:
            total_violations += len(violations)
            for v in violations:
                print(f"    {v}")
        else:
            print(f"    Secure")
    
    print("\n" + "=" * 60)
    if total_violations > 0:
        print(f"  Total violations: {total_violations}")
        print(f"   Run 'chmod' and 'chown' to fix these issues!")
    else:
        print(" All files compliant with security policy")
    print("=" * 60)


if __name__ == "__main__":
    main()