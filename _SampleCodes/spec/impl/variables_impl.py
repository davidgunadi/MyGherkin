from json import loads
from typing import Dict, Any, Optional

from Assert import Assert
from spec.intf.variables_intf import IVariables
from spec.variables import spec
from util.spec import SentenceMatch
from util.casts import cast_value_to_type
import json
from jsonpath_ng.ext import parse


class VariablesImpl(IVariables):

    @spec.impl
    def quality_bar_version_qb_version(
            self,
            qb_version: str
    ):
        # for information only
        pass

    @spec.impl
    def environment(
            self,
            environment: Dict[str, Any],
    ):
        # implemented in JsonPreconditionArgument
        pass

    @spec.impl
    def environment_id_from_envds_url(
            self,
            environment_id: Optional[str],
            envds_url: str
    ):
        # implemented in PreconditionArgument
        pass

    @spec.impl
    def credentials(
            self,
            credentials: Dict[str, Any],
    ):
        # implemented in JsonPreconditionArgument
        pass

    @spec.impl
    def credentials_cred_id_and_cred2_id_and_cred3_id_and_cred4_id_and_cred5_id(
            self,
            cred_id: str,
            cred2_id: Optional[str],
            cred3_id: Optional[str],
            cred4_id: Optional[str],
            cred5_id: Optional[str]
    ):
        # implemented in PreconditionArgument
        pass

    @spec.impl
    def selectors(
            self,
            selectors: Dict[str, Any],
    ):
        # implemented in JsonPreconditionArgument
        pass

    @spec.impl
    def variables(
            self,
            variables: Dict[str, Any],
    ):
        # implemented in JsonPreconditionArgument
        pass

    @spec.impl
    def variable_default_value_is_value(
            self,
            variable: str,
            default: bool,
            value: str
    ):
        if default:
            self.e2e.variables.setdefault(variable, value)
        else:
            self.e2e.variables[variable] = value

    @spec.impl
    def variable_default_value_is(
            self,
            variable: str,
            default: bool,
            value: str
    ):
        self.variable_default_value_is_value(variable, default, value)

    @spec.impl
    def destination_variable_is_a_jsonpath_selected_value_expression_from_source_variable(
            self,
            destination_variable: str,
            expression: str,
            source_variable: str
    ):
        json_path_expression = parse(expression)
        string_source = json.dumps(self.e2e.variables[source_variable], default=lambda o: o.__dict__)
        parsed_json_source = string_to_json(string_source)
        match = json_path_matches(json_path_expression, parsed_json_source)
        if len(match) == 1:
            self.e2e.variables[destination_variable] = match[0].value

        if len(match) > 1:
            destination = []
            for match in json_path_expression.find(parsed_json_source):
                destination.append(match.value)
            self.e2e.variables[destination_variable] = destination

    @spec.impl
    def the_value_of_variable_comparison(
            self,
            variable: str,
            comparison: SentenceMatch
    ):
        value = self.e2e.get_var(variable)
        func = getattr(Assert, comparison.sentence.sentence_id)
        func(value, *comparison.args.values())

    @spec.impl
    def i_convert_a_variable_content_to_function_name(
            self,
            variable: str,
            function_name: str,
    ):
        value = cast_value_to_type(self.e2e.variables[variable], str)
        self.e2e.variables[variable] = {
            'lowercase': value.lower,
            'uppercase': value.upper,
        }[function_name]()


def make_json(text):
    if not text.startswith('{') or not text.endswith('}'):
        text = '{%s}' % (text,)
    return loads(text)


def string_to_json(source):
    try:
        load_input_json = json.loads(json.loads(source))
    except ValueError as e:
        raise Exception(f"Could not parse '{source}' as JSON: ${e}")
    return load_input_json


def json_path_matches(json_path_expression, parsed_json):
    match = json_path_expression.find(parsed_json)
    if len(match) == 0:
        raise Exception(f"No match found with '{json_path_expression}' on jsondata: ${parsed_json}")
    return match
