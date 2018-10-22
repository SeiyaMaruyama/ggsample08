#version 150 core

// ����
const vec4 pl = vec4(3.0, 4.0, 5.0, 1.0);           // �ʒu

// ���_����
in vec4 pv;                                         // ���[�J�����W�n�̒��_�ʒu
in vec4 nv;                                         // ���_�̖@���x�N�g��
in vec2 tv;                                         // ���_�̃e�N�X�`�����W

// �ϊ��s��
uniform mat4 mw;                                    // ���_���W�n�ւ̕ϊ��s��
uniform mat4 mc;                                    // �N���b�s���O���W�n�ւ̕ϊ��s��
uniform mat4 mg;                                    // �@���x�N�g���̕ϊ��s��

// ���X�^���C�U�ɑ��钸�_����
out vec3 l;                                         // �����x�N�g��
out vec3 n;                                         // ���_�̖@���x�N�g��
out vec3 h;                                         // ���ԃx�N�g��
out vec2 tc;                                        // �e�N�X�`�����W

void main(void)
{
  vec4 p = mw * pv;                                 // ���_���W�n�̒��_�̈ʒu
  vec3 v = -normalize(p.xyz / p.w);                 // �����x�N�g��
  l = normalize((pl * p.w - p * pl.w).xyz);         // �����x�N�g��
  n = normalize((mg * nv).xyz);                     // �@���x�N�g��
  h = normalize(l + v);                             // ���ԃx�N�g��
  tc = tv;                                          // �e�N�X�`�����W

  gl_Position = mc * pv;
}
