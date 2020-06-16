from behave import when, then, given
from behave.runner import Context

from spec.ftp import spec
from util.runner import invoke_step
from util.spec import ManualExecutionError


@given(r'FTP connection to ([^\sa-zA-Z0-9])(?P<envhost>(?:(?!\1).)*)(\1)(?: as ([^\sa-zA-Z0-9])(?P<driver>(?:(?!\4).)*)(\4))?')
@spec.behave_step
def ftp_connection_to_envhost_as_driver(context: Context, *args, **kwargs):
    """
        FTP connection to "<envhost>" [as "<ftp driver instance id>"]
        SFTP connection to "<envhost>" [as "<ftp driver instance id>"]

        * <envhost> (required): host definition from environment to connect to
        * <ftp driver instance id> (optional): a shortcut to this connection, "ftp" by default
        """
    invoke_step(context.e2e, context.spec['Ftp'].ftp_connection_to_envhost_as_driver, **kwargs)


@when(r'I download ([^\sa-zA-Z0-9])(?P<filemask>(?:(?!\1).)*)(\1)(?: from ([^\sa-zA-Z0-9])(?P<driver>(?:(?!\4).)*)(\4))?')
@spec.behave_step
def i_download_filemask_from_driver(context: Context, *args, **kwargs):
    """
        I download "<filemask>" [from "<ftp driver instance id>"]

        * <filemask> (required): a mask for files to download
        * <ftp driver instance id> (optional): FTP connection to use, "ftp" by default
        """
    invoke_step(context.e2e, context.spec['Ftp'].i_download_filemask_from_driver, **kwargs)


@when(r'I remove ([^\sa-zA-Z0-9])(?P<filemask>(?:(?!\1).)*)(\1)(?: at ([^\sa-zA-Z0-9])(?P<driver>(?:(?!\4).)*)(\4))?')
@spec.behave_step
def i_remove_filemask_at_driver(context: Context, *args, **kwargs):
    """
        I remove "<filemask>" [at "<ftp driver instance id>"]

        * <filemask> (required): a mask for files to remove
        * <ftp driver instance id> (optional): FTP connection to use, "ftp" by default
        """
    invoke_step(context.e2e, context.spec['Ftp'].i_remove_filemask_at_driver, **kwargs)


@when(r'I list files in ([^\sa-zA-Z0-9])(?P<folder>(?:(?!\1).)*)(\1) folder(?: at ([^\sa-zA-Z0-9])(?P<driver>(?:(?!\4).)*)(\4))?')
@spec.behave_step
def i_list_files_in_folder_folder_at_driver(context: Context, *args, **kwargs):
    """
        I list files in "<folder>" folder [at "<ftp driver instance id>"]

        * <folder> (required): folder where to list files
        * <ftp driver instance id> (optional): FTP connection to use, "ftp" by default
        """
    invoke_step(context.e2e, context.spec['Ftp'].i_list_files_in_folder_folder_at_driver, **kwargs)


@when(r'I wait while ([^\sa-zA-Z0-9])(?P<filemask>(?:(?!\1).)*)(\1) appears(?: at ([^\sa-zA-Z0-9])(?P<driver>(?:(?!\4).)*)(\4))?')
@spec.behave_step
def i_wait_while_filemask_appears_at_driver(context: Context, *args, **kwargs):
    """
        I wait while "<filemask>" appears [at "<ftp driver instance id>"]

        * <filemask> (required): a mask for files to monitor
        * <ftp driver instance id> (optional): FTP connection to use, "ftp" by default
        """
    invoke_step(context.e2e, context.spec['Ftp'].i_wait_while_filemask_appears_at_driver, **kwargs)


@when(r'I wait unless ([^\sa-zA-Z0-9])(?P<filemask>(?:(?!\1).)*)(\1) appears(?: at ([^\sa-zA-Z0-9])(?P<driver>(?:(?!\4).)*)(\4))?')
@spec.behave_step
def i_wait_unless_filemask_appears_at_driver(context: Context, *args, **kwargs):
    """
        I wait unless "<filemask>" appears [at "<ftp driver instance id>"]

        * <filemask> (required): a mask for files to monitor
        * <ftp driver instance id> (optional): FTP connection to use, "ftp" by default
        """
    invoke_step(context.e2e, context.spec['Ftp'].i_wait_unless_filemask_appears_at_driver, **kwargs)


@then(r'operations(?: on ([^\sa-zA-Z0-9])(?P<driver>(?:(?!\1).)*)(\1))? should complete successfully')
@spec.behave_step
def operations_on_driver_should_complete_successfully(context: Context, *args, **kwargs):
    """
        operations [on "<ftp driver instance id>"] should complete successfully

        * <ftp driver instance id> (optional): FTP connection to use, "ftp" by default
        """
    invoke_step(context.e2e, context.spec['Ftp'].operations_on_driver_should_complete_successfully, **kwargs)


@then(r'operations(?: on ([^\sa-zA-Z0-9])(?P<driver>(?:(?!\1).)*)(\1))? should fail')
@spec.behave_step
def operations_on_driver_should_fail(context: Context, *args, **kwargs):
    """
        operations [on "<ftp driver instance id>"] should fail

        * <ftp driver instance id> (optional): FTP connection to use, "ftp" by default
        """
    invoke_step(context.e2e, context.spec['Ftp'].operations_on_driver_should_fail, **kwargs)


@then(r'([^\sa-zA-Z0-9])(?P<filename>(?:(?!\1).)*)(\1) should be in the files list(?: at ([^\sa-zA-Z0-9])(?P<driver>(?:(?!\4).)*)(\4))?')
@spec.behave_step
def filename_should_be_in_the_files_list_at_driver(context: Context, *args, **kwargs):
    """
        "<filename>" should be in the files list [at "<ftp driver instance id>"]

        * <filename> (required): exact file name in file list output or in download output
        * <ftp driver instance id> (optional): FTP connection to use, "ftp" by default
        """
    invoke_step(context.e2e, context.spec['Ftp'].filename_should_be_in_the_files_list_at_driver, **kwargs)


@then(r'I put the list of files in ([^\sa-zA-Z0-9])(?P<folder>(?:(?!\1).)*)(\1)(?: at ([^\sa-zA-Z0-9])(?P<driver>(?:(?!\4).)*)(\4))? into ([^\sa-zA-Z0-9])(?P<variable>(?:(?!\7).)*)(\7)')
@spec.behave_step
def i_put_the_list_of_files_in_folder_at_driver_into_variable(context: Context, *args, **kwargs):
    """
        I put the list of files in "<folder>" [at "<ftp driver instance id>"] into "<variable>"

        * <folder> (required): folder where to list files
        * <ftp driver instance id> (optional): FTP connection to use, "ftp" by default
        * <variable> (required): variable name to store extracted value
        """
    invoke_step(context.e2e, context.spec['Ftp'].i_put_the_list_of_files_in_folder_at_driver_into_variable, **kwargs)
