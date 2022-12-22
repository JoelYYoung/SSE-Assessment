; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_memmove_34.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_memmove_34.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.CWE126_Buffer_Overread__wchar_t_declare_memmove_34_unionType = type { i32* }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__wchar_t_declare_memmove_34_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %myUnion = alloca %union.CWE126_Buffer_Overread__wchar_t_declare_memmove_34_unionType, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %data5 = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata %union.CWE126_Buffer_Overread__wchar_t_declare_memmove_34_unionType* %myUnion, metadata !21, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !28, metadata !DIExpression()), !dbg !32
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !33, metadata !DIExpression()), !dbg !37
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !38
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 49) #6, !dbg !39
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 49, !dbg !40
  store i32 0, i32* %arrayidx, align 4, !dbg !41
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !42
  %call2 = call i32* @wmemset(i32* %arraydecay1, i32 65, i64 99) #6, !dbg !43
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 99, !dbg !44
  store i32 0, i32* %arrayidx3, align 4, !dbg !45
  %arraydecay4 = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !46
  store i32* %arraydecay4, i32** %data, align 8, !dbg !47
  %0 = load i32*, i32** %data, align 8, !dbg !48
  %unionFirst = bitcast %union.CWE126_Buffer_Overread__wchar_t_declare_memmove_34_unionType* %myUnion to i32**, !dbg !49
  store i32* %0, i32** %unionFirst, align 8, !dbg !50
  call void @llvm.dbg.declare(metadata i32** %data5, metadata !51, metadata !DIExpression()), !dbg !53
  %unionSecond = bitcast %union.CWE126_Buffer_Overread__wchar_t_declare_memmove_34_unionType* %myUnion to i32**, !dbg !54
  %1 = load i32*, i32** %unionSecond, align 8, !dbg !54
  store i32* %1, i32** %data5, align 8, !dbg !53
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !55, metadata !DIExpression()), !dbg !57
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !58
  %call7 = call i32* @wmemset(i32* %arraydecay6, i32 67, i64 99) #6, !dbg !59
  %arrayidx8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !60
  store i32 0, i32* %arrayidx8, align 4, !dbg !61
  %arraydecay9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !62
  %2 = bitcast i32* %arraydecay9 to i8*, !dbg !62
  %3 = load i32*, i32** %data5, align 8, !dbg !63
  %4 = bitcast i32* %3 to i8*, !dbg !62
  %arraydecay10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !64
  %call11 = call i64 @wcslen(i32* %arraydecay10) #7, !dbg !65
  %mul = mul i64 %call11, 4, !dbg !66
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %2, i8* align 4 %4, i64 %mul, i1 false), !dbg !62
  %arrayidx12 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !67
  store i32 0, i32* %arrayidx12, align 4, !dbg !68
  %arraydecay13 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !69
  call void @printWLine(i32* %arraydecay13), !dbg !70
  ret void, !dbg !71
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #4

declare dso_local void @printWLine(i32*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__wchar_t_declare_memmove_34_good() #0 !dbg !72 {
entry:
  call void @goodG2B(), !dbg !73
  ret void, !dbg !74
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !75 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !81, metadata !DIExpression()), !dbg !82
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !83, metadata !DIExpression()), !dbg !84
  %call = call i64 @time(i64* null) #6, !dbg !85
  %conv = trunc i64 %call to i32, !dbg !86
  call void @srand(i32 %conv) #6, !dbg !87
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !88
  call void @CWE126_Buffer_Overread__wchar_t_declare_memmove_34_good(), !dbg !89
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !90
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !91
  call void @CWE126_Buffer_Overread__wchar_t_declare_memmove_34_bad(), !dbg !92
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !93
  ret i32 0, !dbg !94
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !95 {
entry:
  %data = alloca i32*, align 8
  %myUnion = alloca %union.CWE126_Buffer_Overread__wchar_t_declare_memmove_34_unionType, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %data5 = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !96, metadata !DIExpression()), !dbg !97
  call void @llvm.dbg.declare(metadata %union.CWE126_Buffer_Overread__wchar_t_declare_memmove_34_unionType* %myUnion, metadata !98, metadata !DIExpression()), !dbg !99
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !100, metadata !DIExpression()), !dbg !101
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !102, metadata !DIExpression()), !dbg !103
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !104
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 49) #6, !dbg !105
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 49, !dbg !106
  store i32 0, i32* %arrayidx, align 4, !dbg !107
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !108
  %call2 = call i32* @wmemset(i32* %arraydecay1, i32 65, i64 99) #6, !dbg !109
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 99, !dbg !110
  store i32 0, i32* %arrayidx3, align 4, !dbg !111
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !112
  store i32* %arraydecay4, i32** %data, align 8, !dbg !113
  %0 = load i32*, i32** %data, align 8, !dbg !114
  %unionFirst = bitcast %union.CWE126_Buffer_Overread__wchar_t_declare_memmove_34_unionType* %myUnion to i32**, !dbg !115
  store i32* %0, i32** %unionFirst, align 8, !dbg !116
  call void @llvm.dbg.declare(metadata i32** %data5, metadata !117, metadata !DIExpression()), !dbg !119
  %unionSecond = bitcast %union.CWE126_Buffer_Overread__wchar_t_declare_memmove_34_unionType* %myUnion to i32**, !dbg !120
  %1 = load i32*, i32** %unionSecond, align 8, !dbg !120
  store i32* %1, i32** %data5, align 8, !dbg !119
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !121, metadata !DIExpression()), !dbg !123
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !124
  %call7 = call i32* @wmemset(i32* %arraydecay6, i32 67, i64 99) #6, !dbg !125
  %arrayidx8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !126
  store i32 0, i32* %arrayidx8, align 4, !dbg !127
  %arraydecay9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !128
  %2 = bitcast i32* %arraydecay9 to i8*, !dbg !128
  %3 = load i32*, i32** %data5, align 8, !dbg !129
  %4 = bitcast i32* %3 to i8*, !dbg !128
  %arraydecay10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !130
  %call11 = call i64 @wcslen(i32* %arraydecay10) #7, !dbg !131
  %mul = mul i64 %call11, 4, !dbg !132
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %2, i8* align 4 %4, i64 %mul, i1 false), !dbg !128
  %arrayidx12 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !133
  store i32 0, i32* %arrayidx12, align 4, !dbg !134
  %arraydecay13 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !135
  call void @printWLine(i32* %arraydecay13), !dbg !136
  ret void, !dbg !137
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_memmove_34.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_declare_memmove_34_bad", scope: !12, file: !12, line: 29, type: !13, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_memmove_34.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 31, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !18, line: 74, baseType: !19)
!18 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 31, column: 15, scope: !11)
!21 = !DILocalVariable(name: "myUnion", scope: !11, file: !12, line: 32, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE126_Buffer_Overread__wchar_t_declare_memmove_34_unionType", file: !12, line: 25, baseType: !23)
!23 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !12, line: 21, size: 64, elements: !24)
!24 = !{!25, !26}
!25 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !23, file: !12, line: 23, baseType: !16, size: 64)
!26 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !23, file: !12, line: 24, baseType: !16, size: 64)
!27 = !DILocation(line: 32, column: 66, scope: !11)
!28 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 33, type: !29)
!29 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 1600, elements: !30)
!30 = !{!31}
!31 = !DISubrange(count: 50)
!32 = !DILocation(line: 33, column: 13, scope: !11)
!33 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 34, type: !34)
!34 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !35)
!35 = !{!36}
!36 = !DISubrange(count: 100)
!37 = !DILocation(line: 34, column: 13, scope: !11)
!38 = !DILocation(line: 35, column: 13, scope: !11)
!39 = !DILocation(line: 35, column: 5, scope: !11)
!40 = !DILocation(line: 36, column: 5, scope: !11)
!41 = !DILocation(line: 36, column: 25, scope: !11)
!42 = !DILocation(line: 37, column: 13, scope: !11)
!43 = !DILocation(line: 37, column: 5, scope: !11)
!44 = !DILocation(line: 38, column: 5, scope: !11)
!45 = !DILocation(line: 38, column: 27, scope: !11)
!46 = !DILocation(line: 40, column: 12, scope: !11)
!47 = !DILocation(line: 40, column: 10, scope: !11)
!48 = !DILocation(line: 41, column: 26, scope: !11)
!49 = !DILocation(line: 41, column: 13, scope: !11)
!50 = !DILocation(line: 41, column: 24, scope: !11)
!51 = !DILocalVariable(name: "data", scope: !52, file: !12, line: 43, type: !16)
!52 = distinct !DILexicalBlock(scope: !11, file: !12, line: 42, column: 5)
!53 = !DILocation(line: 43, column: 19, scope: !52)
!54 = !DILocation(line: 43, column: 34, scope: !52)
!55 = !DILocalVariable(name: "dest", scope: !56, file: !12, line: 45, type: !34)
!56 = distinct !DILexicalBlock(scope: !52, file: !12, line: 44, column: 9)
!57 = !DILocation(line: 45, column: 21, scope: !56)
!58 = !DILocation(line: 46, column: 21, scope: !56)
!59 = !DILocation(line: 46, column: 13, scope: !56)
!60 = !DILocation(line: 47, column: 13, scope: !56)
!61 = !DILocation(line: 47, column: 25, scope: !56)
!62 = !DILocation(line: 50, column: 13, scope: !56)
!63 = !DILocation(line: 50, column: 27, scope: !56)
!64 = !DILocation(line: 50, column: 40, scope: !56)
!65 = !DILocation(line: 50, column: 33, scope: !56)
!66 = !DILocation(line: 50, column: 45, scope: !56)
!67 = !DILocation(line: 51, column: 13, scope: !56)
!68 = !DILocation(line: 51, column: 25, scope: !56)
!69 = !DILocation(line: 52, column: 24, scope: !56)
!70 = !DILocation(line: 52, column: 13, scope: !56)
!71 = !DILocation(line: 55, column: 1, scope: !11)
!72 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_declare_memmove_34_good", scope: !12, file: !12, line: 90, type: !13, scopeLine: 91, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!73 = !DILocation(line: 92, column: 5, scope: !72)
!74 = !DILocation(line: 93, column: 1, scope: !72)
!75 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 104, type: !76, scopeLine: 105, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!76 = !DISubroutineType(types: !77)
!77 = !{!19, !19, !78}
!78 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !79, size: 64)
!79 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !80, size: 64)
!80 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!81 = !DILocalVariable(name: "argc", arg: 1, scope: !75, file: !12, line: 104, type: !19)
!82 = !DILocation(line: 104, column: 14, scope: !75)
!83 = !DILocalVariable(name: "argv", arg: 2, scope: !75, file: !12, line: 104, type: !78)
!84 = !DILocation(line: 104, column: 27, scope: !75)
!85 = !DILocation(line: 107, column: 22, scope: !75)
!86 = !DILocation(line: 107, column: 12, scope: !75)
!87 = !DILocation(line: 107, column: 5, scope: !75)
!88 = !DILocation(line: 109, column: 5, scope: !75)
!89 = !DILocation(line: 110, column: 5, scope: !75)
!90 = !DILocation(line: 111, column: 5, scope: !75)
!91 = !DILocation(line: 114, column: 5, scope: !75)
!92 = !DILocation(line: 115, column: 5, scope: !75)
!93 = !DILocation(line: 116, column: 5, scope: !75)
!94 = !DILocation(line: 118, column: 5, scope: !75)
!95 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 62, type: !13, scopeLine: 63, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!96 = !DILocalVariable(name: "data", scope: !95, file: !12, line: 64, type: !16)
!97 = !DILocation(line: 64, column: 15, scope: !95)
!98 = !DILocalVariable(name: "myUnion", scope: !95, file: !12, line: 65, type: !22)
!99 = !DILocation(line: 65, column: 66, scope: !95)
!100 = !DILocalVariable(name: "dataBadBuffer", scope: !95, file: !12, line: 66, type: !29)
!101 = !DILocation(line: 66, column: 13, scope: !95)
!102 = !DILocalVariable(name: "dataGoodBuffer", scope: !95, file: !12, line: 67, type: !34)
!103 = !DILocation(line: 67, column: 13, scope: !95)
!104 = !DILocation(line: 68, column: 13, scope: !95)
!105 = !DILocation(line: 68, column: 5, scope: !95)
!106 = !DILocation(line: 69, column: 5, scope: !95)
!107 = !DILocation(line: 69, column: 25, scope: !95)
!108 = !DILocation(line: 70, column: 13, scope: !95)
!109 = !DILocation(line: 70, column: 5, scope: !95)
!110 = !DILocation(line: 71, column: 5, scope: !95)
!111 = !DILocation(line: 71, column: 27, scope: !95)
!112 = !DILocation(line: 73, column: 12, scope: !95)
!113 = !DILocation(line: 73, column: 10, scope: !95)
!114 = !DILocation(line: 74, column: 26, scope: !95)
!115 = !DILocation(line: 74, column: 13, scope: !95)
!116 = !DILocation(line: 74, column: 24, scope: !95)
!117 = !DILocalVariable(name: "data", scope: !118, file: !12, line: 76, type: !16)
!118 = distinct !DILexicalBlock(scope: !95, file: !12, line: 75, column: 5)
!119 = !DILocation(line: 76, column: 19, scope: !118)
!120 = !DILocation(line: 76, column: 34, scope: !118)
!121 = !DILocalVariable(name: "dest", scope: !122, file: !12, line: 78, type: !34)
!122 = distinct !DILexicalBlock(scope: !118, file: !12, line: 77, column: 9)
!123 = !DILocation(line: 78, column: 21, scope: !122)
!124 = !DILocation(line: 79, column: 21, scope: !122)
!125 = !DILocation(line: 79, column: 13, scope: !122)
!126 = !DILocation(line: 80, column: 13, scope: !122)
!127 = !DILocation(line: 80, column: 25, scope: !122)
!128 = !DILocation(line: 83, column: 13, scope: !122)
!129 = !DILocation(line: 83, column: 27, scope: !122)
!130 = !DILocation(line: 83, column: 40, scope: !122)
!131 = !DILocation(line: 83, column: 33, scope: !122)
!132 = !DILocation(line: 83, column: 45, scope: !122)
!133 = !DILocation(line: 84, column: 13, scope: !122)
!134 = !DILocation(line: 84, column: 25, scope: !122)
!135 = !DILocation(line: 85, column: 24, scope: !122)
!136 = !DILocation(line: 85, column: 13, scope: !122)
!137 = !DILocation(line: 88, column: 1, scope: !95)
