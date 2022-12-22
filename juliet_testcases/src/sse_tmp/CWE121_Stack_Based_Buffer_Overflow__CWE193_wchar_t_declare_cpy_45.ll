; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_cpy_45.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_cpy_45.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_cpy_45_badData = internal global i32* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.badSink.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_cpy_45_goodG2BData = internal global i32* null, align 8, !dbg !8
@__const.goodG2BSink.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_cpy_45_bad() #0 !dbg !21 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [10 x i32], align 16
  %dataGoodBuffer = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !24, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata [10 x i32]* %dataBadBuffer, metadata !26, metadata !DIExpression()), !dbg !30
  call void @llvm.dbg.declare(metadata [11 x i32]* %dataGoodBuffer, metadata !31, metadata !DIExpression()), !dbg !35
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !36
  store i32* %arraydecay, i32** %data, align 8, !dbg !37
  %0 = load i32*, i32** %data, align 8, !dbg !38
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !38
  store i32 0, i32* %arrayidx, align 4, !dbg !39
  %1 = load i32*, i32** %data, align 8, !dbg !40
  store i32* %1, i32** @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_cpy_45_badData, align 8, !dbg !41
  call void @badSink(), !dbg !42
  ret void, !dbg !43
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_cpy_45_good() #0 !dbg !44 {
entry:
  call void @goodG2B(), !dbg !45
  ret void, !dbg !46
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !47 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !53, metadata !DIExpression()), !dbg !54
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !55, metadata !DIExpression()), !dbg !56
  %call = call i64 @time(i64* null) #5, !dbg !57
  %conv = trunc i64 %call to i32, !dbg !58
  call void @srand(i32 %conv) #5, !dbg !59
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !60
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_cpy_45_good(), !dbg !61
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !62
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !63
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_cpy_45_bad(), !dbg !64
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !65
  ret i32 0, !dbg !66
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @badSink() #0 !dbg !67 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !68, metadata !DIExpression()), !dbg !69
  %0 = load i32*, i32** @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_cpy_45_badData, align 8, !dbg !70
  store i32* %0, i32** %data, align 8, !dbg !69
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !71, metadata !DIExpression()), !dbg !73
  %1 = bitcast [11 x i32]* %source to i8*, !dbg !73
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 bitcast ([11 x i32]* @__const.badSink.source to i8*), i64 44, i1 false), !dbg !73
  %2 = load i32*, i32** %data, align 8, !dbg !74
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !75
  %call = call i32* @wcscpy(i32* %2, i32* %arraydecay) #5, !dbg !76
  %3 = load i32*, i32** %data, align 8, !dbg !77
  call void @printWLine(i32* %3), !dbg !78
  ret void, !dbg !79
}

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

; Function Attrs: nounwind
declare dso_local i32* @wcscpy(i32*, i32*) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !80 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [10 x i32], align 16
  %dataGoodBuffer = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !81, metadata !DIExpression()), !dbg !82
  call void @llvm.dbg.declare(metadata [10 x i32]* %dataBadBuffer, metadata !83, metadata !DIExpression()), !dbg !84
  call void @llvm.dbg.declare(metadata [11 x i32]* %dataGoodBuffer, metadata !85, metadata !DIExpression()), !dbg !86
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !87
  store i32* %arraydecay, i32** %data, align 8, !dbg !88
  %0 = load i32*, i32** %data, align 8, !dbg !89
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !89
  store i32 0, i32* %arrayidx, align 4, !dbg !90
  %1 = load i32*, i32** %data, align 8, !dbg !91
  store i32* %1, i32** @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_cpy_45_goodG2BData, align 8, !dbg !92
  call void @goodG2BSink(), !dbg !93
  ret void, !dbg !94
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink() #0 !dbg !95 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !96, metadata !DIExpression()), !dbg !97
  %0 = load i32*, i32** @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_cpy_45_goodG2BData, align 8, !dbg !98
  store i32* %0, i32** %data, align 8, !dbg !97
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !99, metadata !DIExpression()), !dbg !101
  %1 = bitcast [11 x i32]* %source to i8*, !dbg !101
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 bitcast ([11 x i32]* @__const.goodG2BSink.source to i8*), i64 44, i1 false), !dbg !101
  %2 = load i32*, i32** %data, align 8, !dbg !102
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !103
  %call = call i32* @wcscpy(i32* %2, i32* %arraydecay) #5, !dbg !104
  %3 = load i32*, i32** %data, align 8, !dbg !105
  call void @printWLine(i32* %3), !dbg !106
  ret void, !dbg !107
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!15, !16, !17, !18, !19}
!llvm.ident = !{!20}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_cpy_45_badData", scope: !2, file: !10, line: 26, type: !11, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_cpy_45.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0, !8}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_cpy_45_goodG2BData", scope: !2, file: !10, line: 27, type: !11, isLocal: true, isDefinition: true)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_cpy_45.c", directory: "/root/SSE-Assessment")
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!12 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !13, line: 74, baseType: !14)
!13 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!14 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!15 = !{i32 7, !"Dwarf Version", i32 4}
!16 = !{i32 2, !"Debug Info Version", i32 3}
!17 = !{i32 1, !"wchar_size", i32 4}
!18 = !{i32 7, !"uwtable", i32 1}
!19 = !{i32 7, !"frame-pointer", i32 2}
!20 = !{!"clang version 13.0.0"}
!21 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_cpy_45_bad", scope: !10, file: !10, line: 42, type: !22, scopeLine: 43, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!22 = !DISubroutineType(types: !23)
!23 = !{null}
!24 = !DILocalVariable(name: "data", scope: !21, file: !10, line: 44, type: !11)
!25 = !DILocation(line: 44, column: 15, scope: !21)
!26 = !DILocalVariable(name: "dataBadBuffer", scope: !21, file: !10, line: 45, type: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 320, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 10)
!30 = !DILocation(line: 45, column: 13, scope: !21)
!31 = !DILocalVariable(name: "dataGoodBuffer", scope: !21, file: !10, line: 46, type: !32)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 352, elements: !33)
!33 = !{!34}
!34 = !DISubrange(count: 11)
!35 = !DILocation(line: 46, column: 13, scope: !21)
!36 = !DILocation(line: 49, column: 12, scope: !21)
!37 = !DILocation(line: 49, column: 10, scope: !21)
!38 = !DILocation(line: 50, column: 5, scope: !21)
!39 = !DILocation(line: 50, column: 13, scope: !21)
!40 = !DILocation(line: 51, column: 81, scope: !21)
!41 = !DILocation(line: 51, column: 79, scope: !21)
!42 = !DILocation(line: 52, column: 5, scope: !21)
!43 = !DILocation(line: 53, column: 1, scope: !21)
!44 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_cpy_45_good", scope: !10, file: !10, line: 84, type: !22, scopeLine: 85, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!45 = !DILocation(line: 86, column: 5, scope: !44)
!46 = !DILocation(line: 87, column: 1, scope: !44)
!47 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 98, type: !48, scopeLine: 99, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!48 = !DISubroutineType(types: !49)
!49 = !{!14, !14, !50}
!50 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !51, size: 64)
!51 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !52, size: 64)
!52 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!53 = !DILocalVariable(name: "argc", arg: 1, scope: !47, file: !10, line: 98, type: !14)
!54 = !DILocation(line: 98, column: 14, scope: !47)
!55 = !DILocalVariable(name: "argv", arg: 2, scope: !47, file: !10, line: 98, type: !50)
!56 = !DILocation(line: 98, column: 27, scope: !47)
!57 = !DILocation(line: 101, column: 22, scope: !47)
!58 = !DILocation(line: 101, column: 12, scope: !47)
!59 = !DILocation(line: 101, column: 5, scope: !47)
!60 = !DILocation(line: 103, column: 5, scope: !47)
!61 = !DILocation(line: 104, column: 5, scope: !47)
!62 = !DILocation(line: 105, column: 5, scope: !47)
!63 = !DILocation(line: 108, column: 5, scope: !47)
!64 = !DILocation(line: 109, column: 5, scope: !47)
!65 = !DILocation(line: 110, column: 5, scope: !47)
!66 = !DILocation(line: 112, column: 5, scope: !47)
!67 = distinct !DISubprogram(name: "badSink", scope: !10, file: !10, line: 31, type: !22, scopeLine: 32, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!68 = !DILocalVariable(name: "data", scope: !67, file: !10, line: 33, type: !11)
!69 = !DILocation(line: 33, column: 15, scope: !67)
!70 = !DILocation(line: 33, column: 22, scope: !67)
!71 = !DILocalVariable(name: "source", scope: !72, file: !10, line: 35, type: !32)
!72 = distinct !DILexicalBlock(scope: !67, file: !10, line: 34, column: 5)
!73 = !DILocation(line: 35, column: 17, scope: !72)
!74 = !DILocation(line: 37, column: 16, scope: !72)
!75 = !DILocation(line: 37, column: 22, scope: !72)
!76 = !DILocation(line: 37, column: 9, scope: !72)
!77 = !DILocation(line: 38, column: 20, scope: !72)
!78 = !DILocation(line: 38, column: 9, scope: !72)
!79 = !DILocation(line: 40, column: 1, scope: !67)
!80 = distinct !DISubprogram(name: "goodG2B", scope: !10, file: !10, line: 71, type: !22, scopeLine: 72, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!81 = !DILocalVariable(name: "data", scope: !80, file: !10, line: 73, type: !11)
!82 = !DILocation(line: 73, column: 15, scope: !80)
!83 = !DILocalVariable(name: "dataBadBuffer", scope: !80, file: !10, line: 74, type: !27)
!84 = !DILocation(line: 74, column: 13, scope: !80)
!85 = !DILocalVariable(name: "dataGoodBuffer", scope: !80, file: !10, line: 75, type: !32)
!86 = !DILocation(line: 75, column: 13, scope: !80)
!87 = !DILocation(line: 78, column: 12, scope: !80)
!88 = !DILocation(line: 78, column: 10, scope: !80)
!89 = !DILocation(line: 79, column: 5, scope: !80)
!90 = !DILocation(line: 79, column: 13, scope: !80)
!91 = !DILocation(line: 80, column: 85, scope: !80)
!92 = !DILocation(line: 80, column: 83, scope: !80)
!93 = !DILocation(line: 81, column: 5, scope: !80)
!94 = !DILocation(line: 82, column: 1, scope: !80)
!95 = distinct !DISubprogram(name: "goodG2BSink", scope: !10, file: !10, line: 60, type: !22, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!96 = !DILocalVariable(name: "data", scope: !95, file: !10, line: 62, type: !11)
!97 = !DILocation(line: 62, column: 15, scope: !95)
!98 = !DILocation(line: 62, column: 22, scope: !95)
!99 = !DILocalVariable(name: "source", scope: !100, file: !10, line: 64, type: !32)
!100 = distinct !DILexicalBlock(scope: !95, file: !10, line: 63, column: 5)
!101 = !DILocation(line: 64, column: 17, scope: !100)
!102 = !DILocation(line: 66, column: 16, scope: !100)
!103 = !DILocation(line: 66, column: 22, scope: !100)
!104 = !DILocation(line: 66, column: 9, scope: !100)
!105 = !DILocation(line: 67, column: 20, scope: !100)
!106 = !DILocation(line: 67, column: 9, scope: !100)
!107 = !DILocation(line: 69, column: 1, scope: !95)
