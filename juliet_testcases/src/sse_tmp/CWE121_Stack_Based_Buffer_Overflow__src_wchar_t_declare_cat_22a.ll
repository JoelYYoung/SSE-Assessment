; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_22a.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_22a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_22_badGlobal = dso_local global i32 0, align 4, !dbg !0
@CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_22_goodG2B1Global = dso_local global i32 0, align 4, !dbg !8
@CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_22_goodG2B2Global = dso_local global i32 0, align 4, !dbg !12
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_22_bad() #0 !dbg !20 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !23, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !28, metadata !DIExpression()), !dbg !32
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !33
  store i32* %arraydecay, i32** %data, align 8, !dbg !34
  store i32 1, i32* @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_22_badGlobal, align 4, !dbg !35
  %0 = load i32*, i32** %data, align 8, !dbg !36
  %call = call i32* @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_22_badSource(i32* %0), !dbg !37
  store i32* %call, i32** %data, align 8, !dbg !38
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !39, metadata !DIExpression()), !dbg !44
  %1 = bitcast [50 x i32]* %dest to i8*, !dbg !44
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 200, i1 false), !dbg !44
  %arraydecay1 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !45
  %2 = load i32*, i32** %data, align 8, !dbg !46
  %call2 = call i32* @wcscat(i32* %arraydecay1, i32* %2) #5, !dbg !47
  %3 = load i32*, i32** %data, align 8, !dbg !48
  call void @printWLine(i32* %3), !dbg !49
  ret void, !dbg !50
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32* @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_22_badSource(i32*) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind
declare dso_local i32* @wcscat(i32*, i32*) #4

declare dso_local void @printWLine(i32*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_22_good() #0 !dbg !51 {
entry:
  call void @goodG2B1(), !dbg !52
  call void @goodG2B2(), !dbg !53
  ret void, !dbg !54
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !55 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !61, metadata !DIExpression()), !dbg !62
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !63, metadata !DIExpression()), !dbg !64
  %call = call i64 @time(i64* null) #5, !dbg !65
  %conv = trunc i64 %call to i32, !dbg !66
  call void @srand(i32 %conv) #5, !dbg !67
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !68
  call void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_22_good(), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !71
  call void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_22_bad(), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !73
  ret i32 0, !dbg !74
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !75 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !76, metadata !DIExpression()), !dbg !77
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !78, metadata !DIExpression()), !dbg !79
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !80
  store i32* %arraydecay, i32** %data, align 8, !dbg !81
  store i32 0, i32* @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_22_goodG2B1Global, align 4, !dbg !82
  %0 = load i32*, i32** %data, align 8, !dbg !83
  %call = call i32* @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_22_goodG2B1Source(i32* %0), !dbg !84
  store i32* %call, i32** %data, align 8, !dbg !85
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !86, metadata !DIExpression()), !dbg !88
  %1 = bitcast [50 x i32]* %dest to i8*, !dbg !88
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 200, i1 false), !dbg !88
  %arraydecay1 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !89
  %2 = load i32*, i32** %data, align 8, !dbg !90
  %call2 = call i32* @wcscat(i32* %arraydecay1, i32* %2) #5, !dbg !91
  %3 = load i32*, i32** %data, align 8, !dbg !92
  call void @printWLine(i32* %3), !dbg !93
  ret void, !dbg !94
}

declare dso_local i32* @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_22_goodG2B1Source(i32*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !95 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !96, metadata !DIExpression()), !dbg !97
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !98, metadata !DIExpression()), !dbg !99
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !100
  store i32* %arraydecay, i32** %data, align 8, !dbg !101
  store i32 1, i32* @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_22_goodG2B2Global, align 4, !dbg !102
  %0 = load i32*, i32** %data, align 8, !dbg !103
  %call = call i32* @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_22_goodG2B2Source(i32* %0), !dbg !104
  store i32* %call, i32** %data, align 8, !dbg !105
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !106, metadata !DIExpression()), !dbg !108
  %1 = bitcast [50 x i32]* %dest to i8*, !dbg !108
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 200, i1 false), !dbg !108
  %arraydecay1 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !109
  %2 = load i32*, i32** %data, align 8, !dbg !110
  %call2 = call i32* @wcscat(i32* %arraydecay1, i32* %2) #5, !dbg !111
  %3 = load i32*, i32** %data, align 8, !dbg !112
  call void @printWLine(i32* %3), !dbg !113
  ret void, !dbg !114
}

declare dso_local i32* @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_22_goodG2B2Source(i32*) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_22_badGlobal", scope: !2, file: !10, line: 24, type: !11, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_22a.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0, !8, !12}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_22_goodG2B1Global", scope: !2, file: !10, line: 48, type: !11, isLocal: false, isDefinition: true)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_22a.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_22_goodG2B2Global", scope: !2, file: !10, line: 49, type: !11, isLocal: false, isDefinition: true)
!14 = !{i32 7, !"Dwarf Version", i32 4}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = !{i32 7, !"uwtable", i32 1}
!18 = !{i32 7, !"frame-pointer", i32 2}
!19 = !{!"clang version 13.0.0"}
!20 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_22_bad", scope: !10, file: !10, line: 28, type: !21, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !DILocalVariable(name: "data", scope: !20, file: !10, line: 30, type: !24)
!24 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !25, size: 64)
!25 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !26, line: 74, baseType: !11)
!26 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!27 = !DILocation(line: 30, column: 15, scope: !20)
!28 = !DILocalVariable(name: "dataBuffer", scope: !20, file: !10, line: 31, type: !29)
!29 = !DICompositeType(tag: DW_TAG_array_type, baseType: !25, size: 3200, elements: !30)
!30 = !{!31}
!31 = !DISubrange(count: 100)
!32 = !DILocation(line: 31, column: 13, scope: !20)
!33 = !DILocation(line: 32, column: 12, scope: !20)
!34 = !DILocation(line: 32, column: 10, scope: !20)
!35 = !DILocation(line: 33, column: 78, scope: !20)
!36 = !DILocation(line: 34, column: 85, scope: !20)
!37 = !DILocation(line: 34, column: 12, scope: !20)
!38 = !DILocation(line: 34, column: 10, scope: !20)
!39 = !DILocalVariable(name: "dest", scope: !40, file: !10, line: 36, type: !41)
!40 = distinct !DILexicalBlock(scope: !20, file: !10, line: 35, column: 5)
!41 = !DICompositeType(tag: DW_TAG_array_type, baseType: !25, size: 1600, elements: !42)
!42 = !{!43}
!43 = !DISubrange(count: 50)
!44 = !DILocation(line: 36, column: 17, scope: !40)
!45 = !DILocation(line: 38, column: 16, scope: !40)
!46 = !DILocation(line: 38, column: 22, scope: !40)
!47 = !DILocation(line: 38, column: 9, scope: !40)
!48 = !DILocation(line: 39, column: 20, scope: !40)
!49 = !DILocation(line: 39, column: 9, scope: !40)
!50 = !DILocation(line: 41, column: 1, scope: !20)
!51 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_declare_cat_22_good", scope: !10, file: !10, line: 87, type: !21, scopeLine: 88, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!52 = !DILocation(line: 89, column: 5, scope: !51)
!53 = !DILocation(line: 90, column: 5, scope: !51)
!54 = !DILocation(line: 91, column: 1, scope: !51)
!55 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 103, type: !56, scopeLine: 104, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!56 = !DISubroutineType(types: !57)
!57 = !{!11, !11, !58}
!58 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !59, size: 64)
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !60, size: 64)
!60 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!61 = !DILocalVariable(name: "argc", arg: 1, scope: !55, file: !10, line: 103, type: !11)
!62 = !DILocation(line: 103, column: 14, scope: !55)
!63 = !DILocalVariable(name: "argv", arg: 2, scope: !55, file: !10, line: 103, type: !58)
!64 = !DILocation(line: 103, column: 27, scope: !55)
!65 = !DILocation(line: 106, column: 22, scope: !55)
!66 = !DILocation(line: 106, column: 12, scope: !55)
!67 = !DILocation(line: 106, column: 5, scope: !55)
!68 = !DILocation(line: 108, column: 5, scope: !55)
!69 = !DILocation(line: 109, column: 5, scope: !55)
!70 = !DILocation(line: 110, column: 5, scope: !55)
!71 = !DILocation(line: 113, column: 5, scope: !55)
!72 = !DILocation(line: 114, column: 5, scope: !55)
!73 = !DILocation(line: 115, column: 5, scope: !55)
!74 = !DILocation(line: 117, column: 5, scope: !55)
!75 = distinct !DISubprogram(name: "goodG2B1", scope: !10, file: !10, line: 54, type: !21, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!76 = !DILocalVariable(name: "data", scope: !75, file: !10, line: 56, type: !24)
!77 = !DILocation(line: 56, column: 15, scope: !75)
!78 = !DILocalVariable(name: "dataBuffer", scope: !75, file: !10, line: 57, type: !29)
!79 = !DILocation(line: 57, column: 13, scope: !75)
!80 = !DILocation(line: 58, column: 12, scope: !75)
!81 = !DILocation(line: 58, column: 10, scope: !75)
!82 = !DILocation(line: 59, column: 83, scope: !75)
!83 = !DILocation(line: 60, column: 90, scope: !75)
!84 = !DILocation(line: 60, column: 12, scope: !75)
!85 = !DILocation(line: 60, column: 10, scope: !75)
!86 = !DILocalVariable(name: "dest", scope: !87, file: !10, line: 62, type: !41)
!87 = distinct !DILexicalBlock(scope: !75, file: !10, line: 61, column: 5)
!88 = !DILocation(line: 62, column: 17, scope: !87)
!89 = !DILocation(line: 64, column: 16, scope: !87)
!90 = !DILocation(line: 64, column: 22, scope: !87)
!91 = !DILocation(line: 64, column: 9, scope: !87)
!92 = !DILocation(line: 65, column: 20, scope: !87)
!93 = !DILocation(line: 65, column: 9, scope: !87)
!94 = !DILocation(line: 67, column: 1, scope: !75)
!95 = distinct !DISubprogram(name: "goodG2B2", scope: !10, file: !10, line: 72, type: !21, scopeLine: 73, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!96 = !DILocalVariable(name: "data", scope: !95, file: !10, line: 74, type: !24)
!97 = !DILocation(line: 74, column: 15, scope: !95)
!98 = !DILocalVariable(name: "dataBuffer", scope: !95, file: !10, line: 75, type: !29)
!99 = !DILocation(line: 75, column: 13, scope: !95)
!100 = !DILocation(line: 76, column: 12, scope: !95)
!101 = !DILocation(line: 76, column: 10, scope: !95)
!102 = !DILocation(line: 77, column: 83, scope: !95)
!103 = !DILocation(line: 78, column: 90, scope: !95)
!104 = !DILocation(line: 78, column: 12, scope: !95)
!105 = !DILocation(line: 78, column: 10, scope: !95)
!106 = !DILocalVariable(name: "dest", scope: !107, file: !10, line: 80, type: !41)
!107 = distinct !DILexicalBlock(scope: !95, file: !10, line: 79, column: 5)
!108 = !DILocation(line: 80, column: 17, scope: !107)
!109 = !DILocation(line: 82, column: 16, scope: !107)
!110 = !DILocation(line: 82, column: 22, scope: !107)
!111 = !DILocation(line: 82, column: 9, scope: !107)
!112 = !DILocation(line: 83, column: 20, scope: !107)
!113 = !DILocation(line: 83, column: 9, scope: !107)
!114 = !DILocation(line: 85, column: 1, scope: !95)
