def format_table(headers, rows):
    header_line = " | ".join(headers)
    separator = "-" * len(header_line)
    lines = [header_line, separator]
    for row in rows:
        lines.append(" | ".join(str(c) for c in row))
    return "\n".join(lines)

def severity_color(level):
    return {"LOW": "ℹ️", "MEDIUM": "⚠️", "HIGH": "🔴", "CRITICAL": "💀"}.get(level.upper(), "❓")