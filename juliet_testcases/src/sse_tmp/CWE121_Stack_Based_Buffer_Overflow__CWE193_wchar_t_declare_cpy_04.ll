; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_cpy_04.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_cpy_04.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_cpy_04_bad.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@__const.goodG2B2.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_cpy_04_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [10 x i32], align 16
  %dataGoodBuffer = alloca [11 x i32], align 16
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata [10 x i32]* %dataBadBuffer, metadata !21, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata [11 x i32]* %dataGoodBuffer, metadata !26, metadata !DIExpression()), !dbg !30
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !31
  store i32* %arraydecay, i32** %data, align 8, !dbg !34
  %0 = load i32*, i32** %data, align 8, !dbg !35
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !35
  store i32 0, i32* %arrayidx, align 4, !dbg !36
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !37, metadata !DIExpression()), !dbg !39
  %1 = bitcast [11 x i32]* %source to i8*, !dbg !39
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 bitcast ([11 x i32]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_cpy_04_bad.source to i8*), i64 44, i1 false), !dbg !39
  %2 = load i32*, i32** %data, align 8, !dbg !40
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !41
  %call = call i32* @wcscpy(i32* %2, i32* %arraydecay1) #5, !dbg !42
  %3 = load i32*, i32** %data, align 8, !dbg !43
  call void @printWLine(i32* %3), !dbg !44
  ret void, !dbg !45
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i32* @wcscpy(i32*, i32*) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_cpy_04_good() #0 !dbg !46 {
entry:
  call void @goodG2B1(), !dbg !47
  call void @goodG2B2(), !dbg !48
  ret void, !dbg !49
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !50 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !56, metadata !DIExpression()), !dbg !57
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !58, metadata !DIExpression()), !dbg !59
  %call = call i64 @time(i64* null) #5, !dbg !60
  %conv = trunc i64 %call to i32, !dbg !61
  call void @srand(i32 %conv) #5, !dbg !62
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !63
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_cpy_04_good(), !dbg !64
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !65
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !66
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_cpy_04_bad(), !dbg !67
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !68
  ret i32 0, !dbg !69
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !70 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [10 x i32], align 16
  %dataGoodBuffer = alloca [11 x i32], align 16
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !71, metadata !DIExpression()), !dbg !72
  call void @llvm.dbg.declare(metadata [10 x i32]* %dataBadBuffer, metadata !73, metadata !DIExpression()), !dbg !74
  call void @llvm.dbg.declare(metadata [11 x i32]* %dataGoodBuffer, metadata !75, metadata !DIExpression()), !dbg !76
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !77
  store i32* %arraydecay, i32** %data, align 8, !dbg !80
  %0 = load i32*, i32** %data, align 8, !dbg !81
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !81
  store i32 0, i32* %arrayidx, align 4, !dbg !82
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !83, metadata !DIExpression()), !dbg !85
  %1 = bitcast [11 x i32]* %source to i8*, !dbg !85
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B1.source to i8*), i64 44, i1 false), !dbg !85
  %2 = load i32*, i32** %data, align 8, !dbg !86
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !87
  %call = call i32* @wcscpy(i32* %2, i32* %arraydecay1) #5, !dbg !88
  %3 = load i32*, i32** %data, align 8, !dbg !89
  call void @printWLine(i32* %3), !dbg !90
  ret void, !dbg !91
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !92 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [10 x i32], align 16
  %dataGoodBuffer = alloca [11 x i32], align 16
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !93, metadata !DIExpression()), !dbg !94
  call void @llvm.dbg.declare(metadata [10 x i32]* %dataBadBuffer, metadata !95, metadata !DIExpression()), !dbg !96
  call void @llvm.dbg.declare(metadata [11 x i32]* %dataGoodBuffer, metadata !97, metadata !DIExpression()), !dbg !98
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !99
  store i32* %arraydecay, i32** %data, align 8, !dbg !102
  %0 = load i32*, i32** %data, align 8, !dbg !103
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !103
  store i32 0, i32* %arrayidx, align 4, !dbg !104
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !105, metadata !DIExpression()), !dbg !107
  %1 = bitcast [11 x i32]* %source to i8*, !dbg !107
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B2.source to i8*), i64 44, i1 false), !dbg !107
  %2 = load i32*, i32** %data, align 8, !dbg !108
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !109
  %call = call i32* @wcscpy(i32* %2, i32* %arraydecay1) #5, !dbg !110
  %3 = load i32*, i32** %data, align 8, !dbg !111
  call void @printWLine(i32* %3), !dbg !112
  ret void, !dbg !113
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_cpy_04.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_cpy_04_bad", scope: !12, file: !12, line: 35, type: !13, scopeLine: 36, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_cpy_04.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 37, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !18, line: 74, baseType: !19)
!18 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 37, column: 15, scope: !11)
!21 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 38, type: !22)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 320, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 10)
!25 = !DILocation(line: 38, column: 13, scope: !11)
!26 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 39, type: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 352, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 11)
!30 = !DILocation(line: 39, column: 13, scope: !11)
!31 = !DILocation(line: 44, column: 16, scope: !32)
!32 = distinct !DILexicalBlock(scope: !33, file: !12, line: 41, column: 5)
!33 = distinct !DILexicalBlock(scope: !11, file: !12, line: 40, column: 8)
!34 = !DILocation(line: 44, column: 14, scope: !32)
!35 = !DILocation(line: 45, column: 9, scope: !32)
!36 = !DILocation(line: 45, column: 17, scope: !32)
!37 = !DILocalVariable(name: "source", scope: !38, file: !12, line: 48, type: !27)
!38 = distinct !DILexicalBlock(scope: !11, file: !12, line: 47, column: 5)
!39 = !DILocation(line: 48, column: 17, scope: !38)
!40 = !DILocation(line: 50, column: 16, scope: !38)
!41 = !DILocation(line: 50, column: 22, scope: !38)
!42 = !DILocation(line: 50, column: 9, scope: !38)
!43 = !DILocation(line: 51, column: 20, scope: !38)
!44 = !DILocation(line: 51, column: 9, scope: !38)
!45 = !DILocation(line: 53, column: 1, scope: !11)
!46 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_cpy_04_good", scope: !12, file: !12, line: 106, type: !13, scopeLine: 107, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!47 = !DILocation(line: 108, column: 5, scope: !46)
!48 = !DILocation(line: 109, column: 5, scope: !46)
!49 = !DILocation(line: 110, column: 1, scope: !46)
!50 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 122, type: !51, scopeLine: 123, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!51 = !DISubroutineType(types: !52)
!52 = !{!19, !19, !53}
!53 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !54, size: 64)
!54 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !55, size: 64)
!55 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!56 = !DILocalVariable(name: "argc", arg: 1, scope: !50, file: !12, line: 122, type: !19)
!57 = !DILocation(line: 122, column: 14, scope: !50)
!58 = !DILocalVariable(name: "argv", arg: 2, scope: !50, file: !12, line: 122, type: !53)
!59 = !DILocation(line: 122, column: 27, scope: !50)
!60 = !DILocation(line: 125, column: 22, scope: !50)
!61 = !DILocation(line: 125, column: 12, scope: !50)
!62 = !DILocation(line: 125, column: 5, scope: !50)
!63 = !DILocation(line: 127, column: 5, scope: !50)
!64 = !DILocation(line: 128, column: 5, scope: !50)
!65 = !DILocation(line: 129, column: 5, scope: !50)
!66 = !DILocation(line: 132, column: 5, scope: !50)
!67 = !DILocation(line: 133, column: 5, scope: !50)
!68 = !DILocation(line: 134, column: 5, scope: !50)
!69 = !DILocation(line: 136, column: 5, scope: !50)
!70 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 60, type: !13, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!71 = !DILocalVariable(name: "data", scope: !70, file: !12, line: 62, type: !16)
!72 = !DILocation(line: 62, column: 15, scope: !70)
!73 = !DILocalVariable(name: "dataBadBuffer", scope: !70, file: !12, line: 63, type: !22)
!74 = !DILocation(line: 63, column: 13, scope: !70)
!75 = !DILocalVariable(name: "dataGoodBuffer", scope: !70, file: !12, line: 64, type: !27)
!76 = !DILocation(line: 64, column: 13, scope: !70)
!77 = !DILocation(line: 74, column: 16, scope: !78)
!78 = distinct !DILexicalBlock(scope: !79, file: !12, line: 71, column: 5)
!79 = distinct !DILexicalBlock(scope: !70, file: !12, line: 65, column: 8)
!80 = !DILocation(line: 74, column: 14, scope: !78)
!81 = !DILocation(line: 75, column: 9, scope: !78)
!82 = !DILocation(line: 75, column: 17, scope: !78)
!83 = !DILocalVariable(name: "source", scope: !84, file: !12, line: 78, type: !27)
!84 = distinct !DILexicalBlock(scope: !70, file: !12, line: 77, column: 5)
!85 = !DILocation(line: 78, column: 17, scope: !84)
!86 = !DILocation(line: 80, column: 16, scope: !84)
!87 = !DILocation(line: 80, column: 22, scope: !84)
!88 = !DILocation(line: 80, column: 9, scope: !84)
!89 = !DILocation(line: 81, column: 20, scope: !84)
!90 = !DILocation(line: 81, column: 9, scope: !84)
!91 = !DILocation(line: 83, column: 1, scope: !70)
!92 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 86, type: !13, scopeLine: 87, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!93 = !DILocalVariable(name: "data", scope: !92, file: !12, line: 88, type: !16)
!94 = !DILocation(line: 88, column: 15, scope: !92)
!95 = !DILocalVariable(name: "dataBadBuffer", scope: !92, file: !12, line: 89, type: !22)
!96 = !DILocation(line: 89, column: 13, scope: !92)
!97 = !DILocalVariable(name: "dataGoodBuffer", scope: !92, file: !12, line: 90, type: !27)
!98 = !DILocation(line: 90, column: 13, scope: !92)
!99 = !DILocation(line: 95, column: 16, scope: !100)
!100 = distinct !DILexicalBlock(scope: !101, file: !12, line: 92, column: 5)
!101 = distinct !DILexicalBlock(scope: !92, file: !12, line: 91, column: 8)
!102 = !DILocation(line: 95, column: 14, scope: !100)
!103 = !DILocation(line: 96, column: 9, scope: !100)
!104 = !DILocation(line: 96, column: 17, scope: !100)
!105 = !DILocalVariable(name: "source", scope: !106, file: !12, line: 99, type: !27)
!106 = distinct !DILexicalBlock(scope: !92, file: !12, line: 98, column: 5)
!107 = !DILocation(line: 99, column: 17, scope: !106)
!108 = !DILocation(line: 101, column: 16, scope: !106)
!109 = !DILocation(line: 101, column: 22, scope: !106)
!110 = !DILocation(line: 101, column: 9, scope: !106)
!111 = !DILocation(line: 102, column: 20, scope: !106)
!112 = !DILocation(line: 102, column: 9, scope: !106)
!113 = !DILocation(line: 104, column: 1, scope: !92)
