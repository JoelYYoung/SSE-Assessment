; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_ncpy_41.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_ncpy_41.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_ncpy_41_badSink.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_ncpy_41_goodG2BSink.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_ncpy_41_badSink(i32* %data) #0 !dbg !15 {
entry:
  %data.addr = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !21, metadata !DIExpression()), !dbg !26
  %0 = bitcast [11 x i32]* %source to i8*, !dbg !26
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 16 bitcast ([11 x i32]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_ncpy_41_badSink.source to i8*), i64 44, i1 false), !dbg !26
  %1 = load i32*, i32** %data.addr, align 8, !dbg !27
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !28
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !29
  %call = call i64 @wcslen(i32* %arraydecay1) #6, !dbg !30
  %add = add i64 %call, 1, !dbg !31
  %call2 = call i32* @wcsncpy(i32* %1, i32* %arraydecay, i64 %add) #7, !dbg !32
  %2 = load i32*, i32** %data.addr, align 8, !dbg !33
  call void @printWLine(i32* %2), !dbg !34
  ret void, !dbg !35
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i32* @wcsncpy(i32*, i32*, i64) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #4

declare dso_local void @printWLine(i32*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_ncpy_41_bad() #0 !dbg !36 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !39, metadata !DIExpression()), !dbg !40
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !41, metadata !DIExpression()), !dbg !42
  %0 = alloca i8, i64 40, align 16, !dbg !43
  %1 = bitcast i8* %0 to i32*, !dbg !44
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !42
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !45, metadata !DIExpression()), !dbg !46
  %2 = alloca i8, i64 44, align 16, !dbg !47
  %3 = bitcast i8* %2 to i32*, !dbg !48
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !46
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !49
  store i32* %4, i32** %data, align 8, !dbg !50
  %5 = load i32*, i32** %data, align 8, !dbg !51
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !51
  store i32 0, i32* %arrayidx, align 4, !dbg !52
  %6 = load i32*, i32** %data, align 8, !dbg !53
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_ncpy_41_badSink(i32* %6), !dbg !54
  ret void, !dbg !55
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_ncpy_41_goodG2BSink(i32* %data) #0 !dbg !56 {
entry:
  %data.addr = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !57, metadata !DIExpression()), !dbg !58
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !59, metadata !DIExpression()), !dbg !61
  %0 = bitcast [11 x i32]* %source to i8*, !dbg !61
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 16 bitcast ([11 x i32]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_ncpy_41_goodG2BSink.source to i8*), i64 44, i1 false), !dbg !61
  %1 = load i32*, i32** %data.addr, align 8, !dbg !62
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !63
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !64
  %call = call i64 @wcslen(i32* %arraydecay1) #6, !dbg !65
  %add = add i64 %call, 1, !dbg !66
  %call2 = call i32* @wcsncpy(i32* %1, i32* %arraydecay, i64 %add) #7, !dbg !67
  %2 = load i32*, i32** %data.addr, align 8, !dbg !68
  call void @printWLine(i32* %2), !dbg !69
  ret void, !dbg !70
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_ncpy_41_good() #0 !dbg !71 {
entry:
  call void @goodG2B(), !dbg !72
  ret void, !dbg !73
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !74 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !80, metadata !DIExpression()), !dbg !81
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !82, metadata !DIExpression()), !dbg !83
  %call = call i64 @time(i64* null) #7, !dbg !84
  %conv = trunc i64 %call to i32, !dbg !85
  call void @srand(i32 %conv) #7, !dbg !86
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !87
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_ncpy_41_good(), !dbg !88
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !89
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !90
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_ncpy_41_bad(), !dbg !91
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !92
  ret i32 0, !dbg !93
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !94 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !95, metadata !DIExpression()), !dbg !96
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !97, metadata !DIExpression()), !dbg !98
  %0 = alloca i8, i64 40, align 16, !dbg !99
  %1 = bitcast i8* %0 to i32*, !dbg !100
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !98
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !101, metadata !DIExpression()), !dbg !102
  %2 = alloca i8, i64 44, align 16, !dbg !103
  %3 = bitcast i8* %2 to i32*, !dbg !104
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !102
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !105
  store i32* %4, i32** %data, align 8, !dbg !106
  %5 = load i32*, i32** %data, align 8, !dbg !107
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !107
  store i32 0, i32* %arrayidx, align 4, !dbg !108
  %6 = load i32*, i32** %data, align 8, !dbg !109
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_ncpy_41_goodG2BSink(i32* %6), !dbg !110
  ret void, !dbg !111
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_ncpy_41.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !8}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !6, line: 74, baseType: !7)
!6 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{i32 7, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{i32 1, !"wchar_size", i32 4}
!12 = !{i32 7, !"uwtable", i32 1}
!13 = !{i32 7, !"frame-pointer", i32 2}
!14 = !{!"clang version 13.0.0"}
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_ncpy_41_badSink", scope: !16, file: !16, line: 28, type: !17, scopeLine: 29, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_ncpy_41.c", directory: "/root/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null, !4}
!19 = !DILocalVariable(name: "data", arg: 1, scope: !15, file: !16, line: 28, type: !4)
!20 = !DILocation(line: 28, column: 90, scope: !15)
!21 = !DILocalVariable(name: "source", scope: !22, file: !16, line: 31, type: !23)
!22 = distinct !DILexicalBlock(scope: !15, file: !16, line: 30, column: 5)
!23 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 352, elements: !24)
!24 = !{!25}
!25 = !DISubrange(count: 11)
!26 = !DILocation(line: 31, column: 17, scope: !22)
!27 = !DILocation(line: 34, column: 17, scope: !22)
!28 = !DILocation(line: 34, column: 23, scope: !22)
!29 = !DILocation(line: 34, column: 38, scope: !22)
!30 = !DILocation(line: 34, column: 31, scope: !22)
!31 = !DILocation(line: 34, column: 46, scope: !22)
!32 = !DILocation(line: 34, column: 9, scope: !22)
!33 = !DILocation(line: 35, column: 20, scope: !22)
!34 = !DILocation(line: 35, column: 9, scope: !22)
!35 = !DILocation(line: 37, column: 1, scope: !15)
!36 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_ncpy_41_bad", scope: !16, file: !16, line: 39, type: !37, scopeLine: 40, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!37 = !DISubroutineType(types: !38)
!38 = !{null}
!39 = !DILocalVariable(name: "data", scope: !36, file: !16, line: 41, type: !4)
!40 = !DILocation(line: 41, column: 15, scope: !36)
!41 = !DILocalVariable(name: "dataBadBuffer", scope: !36, file: !16, line: 42, type: !4)
!42 = !DILocation(line: 42, column: 15, scope: !36)
!43 = !DILocation(line: 42, column: 42, scope: !36)
!44 = !DILocation(line: 42, column: 31, scope: !36)
!45 = !DILocalVariable(name: "dataGoodBuffer", scope: !36, file: !16, line: 43, type: !4)
!46 = !DILocation(line: 43, column: 15, scope: !36)
!47 = !DILocation(line: 43, column: 43, scope: !36)
!48 = !DILocation(line: 43, column: 32, scope: !36)
!49 = !DILocation(line: 46, column: 12, scope: !36)
!50 = !DILocation(line: 46, column: 10, scope: !36)
!51 = !DILocation(line: 47, column: 5, scope: !36)
!52 = !DILocation(line: 47, column: 13, scope: !36)
!53 = !DILocation(line: 48, column: 79, scope: !36)
!54 = !DILocation(line: 48, column: 5, scope: !36)
!55 = !DILocation(line: 49, column: 1, scope: !36)
!56 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_ncpy_41_goodG2BSink", scope: !16, file: !16, line: 55, type: !17, scopeLine: 56, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!57 = !DILocalVariable(name: "data", arg: 1, scope: !56, file: !16, line: 55, type: !4)
!58 = !DILocation(line: 55, column: 94, scope: !56)
!59 = !DILocalVariable(name: "source", scope: !60, file: !16, line: 58, type: !23)
!60 = distinct !DILexicalBlock(scope: !56, file: !16, line: 57, column: 5)
!61 = !DILocation(line: 58, column: 17, scope: !60)
!62 = !DILocation(line: 61, column: 17, scope: !60)
!63 = !DILocation(line: 61, column: 23, scope: !60)
!64 = !DILocation(line: 61, column: 38, scope: !60)
!65 = !DILocation(line: 61, column: 31, scope: !60)
!66 = !DILocation(line: 61, column: 46, scope: !60)
!67 = !DILocation(line: 61, column: 9, scope: !60)
!68 = !DILocation(line: 62, column: 20, scope: !60)
!69 = !DILocation(line: 62, column: 9, scope: !60)
!70 = !DILocation(line: 64, column: 1, scope: !56)
!71 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_ncpy_41_good", scope: !16, file: !16, line: 79, type: !37, scopeLine: 80, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!72 = !DILocation(line: 81, column: 5, scope: !71)
!73 = !DILocation(line: 82, column: 1, scope: !71)
!74 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 94, type: !75, scopeLine: 95, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!75 = !DISubroutineType(types: !76)
!76 = !{!7, !7, !77}
!77 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !78, size: 64)
!78 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !79, size: 64)
!79 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!80 = !DILocalVariable(name: "argc", arg: 1, scope: !74, file: !16, line: 94, type: !7)
!81 = !DILocation(line: 94, column: 14, scope: !74)
!82 = !DILocalVariable(name: "argv", arg: 2, scope: !74, file: !16, line: 94, type: !77)
!83 = !DILocation(line: 94, column: 27, scope: !74)
!84 = !DILocation(line: 97, column: 22, scope: !74)
!85 = !DILocation(line: 97, column: 12, scope: !74)
!86 = !DILocation(line: 97, column: 5, scope: !74)
!87 = !DILocation(line: 99, column: 5, scope: !74)
!88 = !DILocation(line: 100, column: 5, scope: !74)
!89 = !DILocation(line: 101, column: 5, scope: !74)
!90 = !DILocation(line: 104, column: 5, scope: !74)
!91 = !DILocation(line: 105, column: 5, scope: !74)
!92 = !DILocation(line: 106, column: 5, scope: !74)
!93 = !DILocation(line: 108, column: 5, scope: !74)
!94 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 67, type: !37, scopeLine: 68, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!95 = !DILocalVariable(name: "data", scope: !94, file: !16, line: 69, type: !4)
!96 = !DILocation(line: 69, column: 15, scope: !94)
!97 = !DILocalVariable(name: "dataBadBuffer", scope: !94, file: !16, line: 70, type: !4)
!98 = !DILocation(line: 70, column: 15, scope: !94)
!99 = !DILocation(line: 70, column: 42, scope: !94)
!100 = !DILocation(line: 70, column: 31, scope: !94)
!101 = !DILocalVariable(name: "dataGoodBuffer", scope: !94, file: !16, line: 71, type: !4)
!102 = !DILocation(line: 71, column: 15, scope: !94)
!103 = !DILocation(line: 71, column: 43, scope: !94)
!104 = !DILocation(line: 71, column: 32, scope: !94)
!105 = !DILocation(line: 74, column: 12, scope: !94)
!106 = !DILocation(line: 74, column: 10, scope: !94)
!107 = !DILocation(line: 75, column: 5, scope: !94)
!108 = !DILocation(line: 75, column: 13, scope: !94)
!109 = !DILocation(line: 76, column: 83, scope: !94)
!110 = !DILocation(line: 76, column: 5, scope: !94)
!111 = !DILocation(line: 77, column: 1, scope: !94)
