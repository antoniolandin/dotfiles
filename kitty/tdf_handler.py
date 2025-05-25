from kittens.tui.handler import result_handler
import os


def main(args):
    pass


@result_handler(no_ui=True)
def handle_result(args, result, target_window_id, boss):
    cmd = "tdf --fullscreen true " + os.path.expanduser(args[1])
    window_title = "tdf"

    # Try to find an existing window
    for window in boss.match_windows("title:" + window_title):
        if " ".join(window.child.foreground_cmdline).endswith(cmd):
            boss.child_monitor.needs_write(window.id, b"q")  # bytes for 'q'
        else:
            boss.child_monitor.needs_write(window.id, b"\x03")  # bytes for Ctrl+C

        boss.child_monitor.needs_write(
            window.id, cmd.encode() + b"\x0d"
        )  # bytes for Enter

        return

    # Create new window if none exists
    tab = boss.active_tab
    if tab is not None:
        tab.goto_layout("tall")
        active_window = tab.active_window
        window = tab.new_window(override_title=window_title, location="vsplit")

        boss.child_monitor.needs_write(window.id, cmd.encode() + b"\x0d")

        boss.set_active_window(active_window)
