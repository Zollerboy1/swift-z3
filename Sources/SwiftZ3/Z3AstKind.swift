import CZ3

/// The different kinds of Z3 AST (abstract syntax trees). That is, terms,
/// formulas and types.
public typealias Z3AstKind = Z3_ast_kind

public extension Z3AstKind {
    /// constant and applications
    static let numeralAst = Z3_NUMERAL_AST
    /// numeral constants
    static let appAst = Z3_APP_AST
    /// bound variables
    static let varAst = Z3_VAR_AST
    /// quantifiers
    static let quantifierAst = Z3_QUANTIFIER_AST
    /// sort
    static let sortAst = Z3_SORT_AST
    /// function declaration
    static let funcDeclAst = Z3_FUNC_DECL_AST
    /// internal
    static let unknownAst = Z3_UNKNOWN_AST
}
