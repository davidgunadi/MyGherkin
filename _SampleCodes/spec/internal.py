from util.spec import Spec

spec = Spec('Internal',
            imports="""
                from typing import Dict, Any
                from util.spec import SentenceMatch
            """)
given = spec.given
when = spec.when
then = spec.then


when(
    'I debug',
    doc="""
        I debug

        A dummy pass step, that meant to have a place for putting a breakpoint by maintenance team only.
    """
)
