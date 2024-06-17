<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Principal.Master" CodeBehind="Empleado.aspx.vb" Inherits="ProjectWebSistemaFerreteria.Formulario_web1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link href="../CSS/style.css" rel="stylesheet" />

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">

        <h1 class="rounded">GESTIONAR EMPLEADO</h1>

        <div class="row contenedor-principal p-3">
            <div class="col-md-10 border border-gray p-3 mt-2 ">
                <asp:Panel runat="server">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group mb-2">
                                <label for="txtCodigo" class="mb-1">Código:</label>
                                <div class="input-group">
                                    <asp:TextBox ID="txtCodigo" runat="server" CssClass="form-control "></asp:TextBox>
                                    <asp:Button ID="btnBuscarEmp" runat="server" Text="Buscar" CssClass="btn  btnBuscar" OnClick="btnBuscarEmp_Click"></asp:Button>

                                </div>
                            </div>
                            <div class="form-group mb-2">
                                <label for="txtNombres" class="mb-1">Nombres:</label>
                                <asp:TextBox ID="txtNombres" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="form-group mb-2">
                                <label for="txtApellidos" class="mb-1">Apellidos:</label>
                                <asp:TextBox ID="txtApellidos" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>

                            <div class="form-group mb-2">
                                <label for="cbxSexo" class="mb-1">Sexo:</label>
                                <asp:DropDownList ID="cbxSexo" runat="server" CssClass="form-control">
                                    <asp:ListItem Text="Masculino" Value="Masculino"></asp:ListItem>
                                    <asp:ListItem Text="Femenino" Value="Femenino"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="form-group mb-2">
                                <label id="txtFechaNac" runat="server" for="txtFechaNac" class="mb-1">Fecha de Nacimiento:</label>
                                <div class="input-group">
                                    <asp:TextBox ID="txtFecha" runat="server" CssClass="form-control"></asp:TextBox>

                                </div>

                            </div>


                        </div>
                        <div class="col-md-6">
                            <div class="form-group mb-2">
                                <label for="cbxTipoEmpleado" class="mb-1">Tipo:</label>
                                <asp:DropDownList ID="cbxTipoEmpleado" runat="server" CssClass="form-control">
                                </asp:DropDownList>
                            </div>


                            <div class="form-group mb-2">
                                <label for="txtDni" class="mb-1">DNI:</label>
                                <asp:TextBox ID="txtDni" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>

                            <div class="form-group mb-2">
                                <label for="txtCelular" class="mb-1">Celular:</label>
                                <asp:TextBox ID="txtCelular" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>

                            <div class="form-group mb-2">
                                <label for="txtEmail" class="mb-1">Email:</label>
                                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="form-group mb-2">
                                <label for="txtDireccion" class="mb-1">Dirección:</label>
                                <asp:TextBox ID="txtDireccion" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="form-group form-check mb-2">
                                <label clss="form-check-label mb-1" for="chbxVigente">Vigente: </label>

                                <asp:CheckBox ID="chbxVigente" runat="server" CssClass="form-check-input" />

                            </div>
                        </div>

                    </div>


                </asp:Panel>
            </div>
            <div class="col-md-2 border border-gray p-4 mt-2 ">
                <asp:Panel runat="server">
                    <div class="row my-4">
                        <div class="mb-3">
                            <asp:Button ID="btnGuardar" runat="server" Text="Nuevo" CssClass="btn  btnGuardar w-100" OnClick="btnGuardar_Click" />
                        </div>
                        <div class=" mb-3">
                            <asp:Button ID="btnModificar" runat="server" Text="Modificar" CssClass="btn  btnModificar w-100" OnClick="btnModificar_Click" />
                        </div>
                        <div class=" mb-3">
                            <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" CssClass="btn  btnEliminar w-100" OnClick="btnEliminar_Click" />
                        </div>
                        <div class="mb-3">
                            <asp:Button ID="btnDarBaja" runat="server" Text="Dar baja" CssClass="btn  btnDarBaja w-100" OnClick="btnDarBaja_Click" />
                        </div>
                        <div class="mb-3">
                            <asp:Button ID="btnLimpiar" runat="server" Text="Limpiar" CssClass="btn  btnLimpiar w-100" OnClick="btnLimpiar_Click" />
                        </div>
                        <div class="mb-3">
                            <asp:Button ID="btnSalir" runat="server" Text="Salir" CssClass="btn btnSalir w-100" />
                        </div>
                    </div>
                </asp:Panel>
            </div>
        </div>
        <div class="row mt-4 contenedor-tabla">
            <div class=" col-12">
                <asp:GridView ID="dgvEmpleado" runat="server" CssClass="table table-striped table-bordered" AutoGenerateColumns="False">
                    <Columns>
                        <asp:BoundField DataField="codEmpleado" HeaderText="ID"></asp:BoundField>
                        <asp:BoundField DataField="dni" HeaderText="DNI"></asp:BoundField>
                        <asp:TemplateField HeaderText="Nombres completos">
                            <ItemTemplate>
                                <%# Eval("nombres") + " " + Eval("apellidos") %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="fechaNac" HeaderText="FECHA NAC"></asp:BoundField>
                        <asp:CheckBoxField DataField="sexo" HeaderText="SEXO"></asp:CheckBoxField>
                        <asp:BoundField DataField="numCelular" HeaderText="CELULAR"></asp:BoundField>
                        <asp:BoundField DataField="email" HeaderText="EMAIL"></asp:BoundField>
                        <asp:CheckBoxField DataField="vigencia" HeaderText="VIGENCIA"></asp:CheckBoxField>
                        <asp:BoundField DataField="nombre" HeaderText="TIPO"></asp:BoundField>
                    </Columns>
                    <Columns>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>

</asp:Content>
