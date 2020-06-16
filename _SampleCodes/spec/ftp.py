from driver.FtpDriver import FtpDriver
from util.spec import Spec, Argument, UseDriverArgument, InitDriverArgument, EnumArgument

spec = Spec('FTP/SFTP',
            spec_id='Ftp',
            imports="""
                from driver.FtpDriver import FtpDriver
            """)
given = spec.given
when = spec.when
then = spec.then


def driver_arg():
    return UseDriverArgument('FTP connection to use, "ftp" by default', FtpDriver)


given(
    '<protocol> connection to "<endpoint>" [as "<ftp driver instance id>"]',
    args={
        'protocol': EnumArgument('connection protocol', values=['FTP', 'SFTP']),
        'endpoint': Argument('endpoint definition from environment to connect to'),
        'ftp driver instance id': InitDriverArgument('a shortcut to this connection, "ftp" by default', FtpDriver),
    },
    doc="""
        FTP connection to "<endpoint>" [as "<ftp driver instance id>"]
        SFTP connection to "<endpoint>" [as "<ftp driver instance id>"]

        * <endpoint> (required): endpoint definition from environment to connect to
        * <ftp driver instance id> (optional): a shortcut to this connection, "ftp" by default
        """
)


when(
    'I upload "<file>" to "<folder>" [at "<ftp driver instance id>"]',
    args={
        'file': Argument('file to upload'),
        'folder': Argument('folder on FTP server to which file should be uploaded'),
        'ftp driver instance id': driver_arg(),
    },
    doc="""
        I upload "<file>" to "<folder>" [at "<ftp driver instance id>"]

        * <file> (required): file to upload
        * <folder> (required): folder on FTP server to which file should be uploaded
        * <ftp driver instance id> (optional): FTP connection to use, "ftp" by default
        """
)


when(
    'I download "<filemask>" [from "<ftp driver instance id>"]',
    args={
        'filemask': Argument('a mask for files to download'),
        'ftp driver instance id': driver_arg(),
    },
    doc="""
        I download "<filemask>" [from "<ftp driver instance id>"]

        * <filemask> (required): a mask for files to download
        * <ftp driver instance id> (optional): FTP connection to use, "ftp" by default
        """
)


when(
    'I remove "<filemask>" [at "<ftp driver instance id>"]',
    args={
        'filemask': Argument('a mask for files to remove'),
        'ftp driver instance id': driver_arg(),
    },
    doc="""
        I remove "<filemask>" [at "<ftp driver instance id>"]

        * <filemask> (required): a mask for files to remove
        * <ftp driver instance id> (optional): FTP connection to use, "ftp" by default
        """
)


when(
    'I list files in "<folder>" folder [at "<ftp driver instance id>"]',
    args={
        'folder': Argument('folder where to list files'),
        'ftp driver instance id': driver_arg(),
    },
    doc="""
        I list files in "<folder>" folder [at "<ftp driver instance id>"]

        * <folder> (required): folder where to list files
        * <ftp driver instance id> (optional): FTP connection to use, "ftp" by default
        """
)


when(
    'I wait while "<filemask>" appears [at "<ftp driver instance id>"]',
    args={
        'filemask': Argument('a mask for files to monitor'),
        'ftp driver instance id': driver_arg(),
    },
    doc="""
        I wait while "<filemask>" appears [at "<ftp driver instance id>"]

        * <filemask> (required): a mask for files to monitor
        * <ftp driver instance id> (optional): FTP connection to use, "ftp" by default
        """
)


when(
    'I wait unless "<filemask>" appears [at "<ftp driver instance id>"]',
    args={
        'filemask': Argument('a mask for files to monitor'),
        'ftp driver instance id': driver_arg(),
    },
    doc="""
        I wait unless "<filemask>" appears [at "<ftp driver instance id>"]

        * <filemask> (required): a mask for files to monitor
        * <ftp driver instance id> (optional): FTP connection to use, "ftp" by default
        """
)


then(
    'operations [on "<ftp driver instance id>"] should complete successfully',
    args={
        'ftp driver instance id': driver_arg(),
    },
    doc="""
        operations [on "<ftp driver instance id>"] should complete successfully

        * <ftp driver instance id> (optional): FTP connection to use, "ftp" by default
        """
)


then(
    'operations [on "<ftp driver instance id>"] should fail',
    args={
        'ftp driver instance id': driver_arg(),
    },
    doc="""
        operations [on "<ftp driver instance id>"] should fail

        * <ftp driver instance id> (optional): FTP connection to use, "ftp" by default
        """
)


then(
    '"<filename>" should be in the files list [at "<ftp driver instance id>"]',
    args={
        'filename': Argument('exact file name in file list output or in download output'),
        'ftp driver instance id': driver_arg(),
    },
    doc="""
        "<filename>" should be in the files list [at "<ftp driver instance id>"]

        * <filename> (required): exact file name in file list output or in download output
        * <ftp driver instance id> (optional): FTP connection to use, "ftp" by default
        """
)


then(
    'I put the list of files in "<folder>" [at "<ftp driver instance id>"] into "<variable>"',
    args={
        'folder': Argument('folder where to list files'),
        'ftp driver instance id': driver_arg(),
        'variable': Argument('variable name to store extracted value'),
    },
    doc="""
        I put the list of files in "<folder>" [at "<ftp driver instance id>"] into "<variable>"

        * <folder> (required): folder where to list files
        * <ftp driver instance id> (optional): FTP connection to use, "ftp" by default
        * <variable> (required): variable name to store extracted value
        """
)


then(
    'I remember the list of files in "<folder>" [at "<ftp driver instance id>"] as "<variable>"',
    args={
        'folder': Argument('folder where to list files'),
        'ftp driver instance id': driver_arg(),
        'variable': Argument('variable name to store extracted value'),
    },
    doc="""
        I remember the list of files in "<folder>" [at "<ftp driver instance id>"] as "<variable>"

        * <folder> (required): folder where to list files
        * <ftp driver instance id> (optional): FTP connection to use, "ftp" by default
        * <variable> (required): variable name to store extracted value
        """
)
