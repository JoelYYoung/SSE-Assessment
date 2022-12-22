; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_41.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_41.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_41_badSink.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_41_goodG2BSink.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_41_badSink(i32* %data) #0 !dbg !15 {
entry:
  %data.addr = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !21, metadata !DIExpression()), !dbg !26
  %0 = bitcast [11 x i32]* %source to i8*, !dbg !26
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 16 bitcast ([11 x i32]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_41_badSink.source to i8*), i64 44, i1 false), !dbg !26
  %1 = load i32*, i32** %data.addr, align 8, !dbg !27
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !28
  %call = call i32* @wcscpy(i32* %1, i32* %arraydecay) #5, !dbg !29
  %2 = load i32*, i32** %data.addr, align 8, !dbg !30
  call void @printWLine(i32* %2), !dbg !31
  ret void, !dbg !32
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i32* @wcscpy(i32*, i32*) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_41_bad() #0 !dbg !33 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !36, metadata !DIExpression()), !dbg !37
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !38, metadata !DIExpression()), !dbg !39
  %0 = alloca i8, i64 40, align 16, !dbg !40
  %1 = bitcast i8* %0 to i32*, !dbg !41
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !39
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !42, metadata !DIExpression()), !dbg !43
  %2 = alloca i8, i64 44, align 16, !dbg !44
  %3 = bitcast i8* %2 to i32*, !dbg !45
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !43
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !46
  store i32* %4, i32** %data, align 8, !dbg !47
  %5 = load i32*, i32** %data, align 8, !dbg !48
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !48
  store i32 0, i32* %arrayidx, align 4, !dbg !49
  %6 = load i32*, i32** %data, align 8, !dbg !50
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_41_badSink(i32* %6), !dbg !51
  ret void, !dbg !52
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_41_goodG2BSink(i32* %data) #0 !dbg !53 {
entry:
  %data.addr = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !54, metadata !DIExpression()), !dbg !55
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !56, metadata !DIExpression()), !dbg !58
  %0 = bitcast [11 x i32]* %source to i8*, !dbg !58
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 16 bitcast ([11 x i32]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_41_goodG2BSink.source to i8*), i64 44, i1 false), !dbg !58
  %1 = load i32*, i32** %data.addr, align 8, !dbg !59
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !60
  %call = call i32* @wcscpy(i32* %1, i32* %arraydecay) #5, !dbg !61
  %2 = load i32*, i32** %data.addr, align 8, !dbg !62
  call void @printWLine(i32* %2), !dbg !63
  ret void, !dbg !64
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_41_good() #0 !dbg !65 {
entry:
  call void @goodG2B(), !dbg !66
  ret void, !dbg !67
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !68 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !74, metadata !DIExpression()), !dbg !75
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !76, metadata !DIExpression()), !dbg !77
  %call = call i64 @time(i64* null) #5, !dbg !78
  %conv = trunc i64 %call to i32, !dbg !79
  call void @srand(i32 %conv) #5, !dbg !80
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !81
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_41_good(), !dbg !82
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !83
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !84
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_41_bad(), !dbg !85
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !86
  ret i32 0, !dbg !87
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !88 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !89, metadata !DIExpression()), !dbg !90
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !91, metadata !DIExpression()), !dbg !92
  %0 = alloca i8, i64 40, align 16, !dbg !93
  %1 = bitcast i8* %0 to i32*, !dbg !94
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !92
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !95, metadata !DIExpression()), !dbg !96
  %2 = alloca i8, i64 44, align 16, !dbg !97
  %3 = bitcast i8* %2 to i32*, !dbg !98
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !96
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !99
  store i32* %4, i32** %data, align 8, !dbg !100
  %5 = load i32*, i32** %data, align 8, !dbg !101
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !101
  store i32 0, i32* %arrayidx, align 4, !dbg !102
  %6 = load i32*, i32** %data, align 8, !dbg !103
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_41_goodG2BSink(i32* %6), !dbg !104
  ret void, !dbg !105
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_41.c", directory: "/root/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_41_badSink", scope: !16, file: !16, line: 28, type: !17, scopeLine: 29, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_41.c", directory: "/root/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null, !4}
!19 = !DILocalVariable(name: "data", arg: 1, scope: !15, file: !16, line: 28, type: !4)
!20 = !DILocation(line: 28, column: 89, scope: !15)
!21 = !DILocalVariable(name: "source", scope: !22, file: !16, line: 31, type: !23)
!22 = distinct !DILexicalBlock(scope: !15, file: !16, line: 30, column: 5)
!23 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 352, elements: !24)
!24 = !{!25}
!25 = !DISubrange(count: 11)
!26 = !DILocation(line: 31, column: 17, scope: !22)
!27 = !DILocation(line: 33, column: 16, scope: !22)
!28 = !DILocation(line: 33, column: 22, scope: !22)
!29 = !DILocation(line: 33, column: 9, scope: !22)
!30 = !DILocation(line: 34, column: 20, scope: !22)
!31 = !DILocation(line: 34, column: 9, scope: !22)
!32 = !DILocation(line: 36, column: 1, scope: !15)
!33 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_41_bad", scope: !16, file: !16, line: 38, type: !34, scopeLine: 39, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!34 = !DISubroutineType(types: !35)
!35 = !{null}
!36 = !DILocalVariable(name: "data", scope: !33, file: !16, line: 40, type: !4)
!37 = !DILocation(line: 40, column: 15, scope: !33)
!38 = !DILocalVariable(name: "dataBadBuffer", scope: !33, file: !16, line: 41, type: !4)
!39 = !DILocation(line: 41, column: 15, scope: !33)
!40 = !DILocation(line: 41, column: 42, scope: !33)
!41 = !DILocation(line: 41, column: 31, scope: !33)
!42 = !DILocalVariable(name: "dataGoodBuffer", scope: !33, file: !16, line: 42, type: !4)
!43 = !DILocation(line: 42, column: 15, scope: !33)
!44 = !DILocation(line: 42, column: 43, scope: !33)
!45 = !DILocation(line: 42, column: 32, scope: !33)
!46 = !DILocation(line: 45, column: 12, scope: !33)
!47 = !DILocation(line: 45, column: 10, scope: !33)
!48 = !DILocation(line: 46, column: 5, scope: !33)
!49 = !DILocation(line: 46, column: 13, scope: !33)
!50 = !DILocation(line: 47, column: 78, scope: !33)
!51 = !DILocation(line: 47, column: 5, scope: !33)
!52 = !DILocation(line: 48, column: 1, scope: !33)
!53 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_41_goodG2BSink", scope: !16, file: !16, line: 54, type: !17, scopeLine: 55, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!54 = !DILocalVariable(name: "data", arg: 1, scope: !53, file: !16, line: 54, type: !4)
!55 = !DILocation(line: 54, column: 93, scope: !53)
!56 = !DILocalVariable(name: "source", scope: !57, file: !16, line: 57, type: !23)
!57 = distinct !DILexicalBlock(scope: !53, file: !16, line: 56, column: 5)
!58 = !DILocation(line: 57, column: 17, scope: !57)
!59 = !DILocation(line: 59, column: 16, scope: !57)
!60 = !DILocation(line: 59, column: 22, scope: !57)
!61 = !DILocation(line: 59, column: 9, scope: !57)
!62 = !DILocation(line: 60, column: 20, scope: !57)
!63 = !DILocation(line: 60, column: 9, scope: !57)
!64 = !DILocation(line: 62, column: 1, scope: !53)
!65 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_cpy_41_good", scope: !16, file: !16, line: 77, type: !34, scopeLine: 78, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!66 = !DILocation(line: 79, column: 5, scope: !65)
!67 = !DILocation(line: 80, column: 1, scope: !65)
!68 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 92, type: !69, scopeLine: 93, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!69 = !DISubroutineType(types: !70)
!70 = !{!7, !7, !71}
!71 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !72, size: 64)
!72 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !73, size: 64)
!73 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!74 = !DILocalVariable(name: "argc", arg: 1, scope: !68, file: !16, line: 92, type: !7)
!75 = !DILocation(line: 92, column: 14, scope: !68)
!76 = !DILocalVariable(name: "argv", arg: 2, scope: !68, file: !16, line: 92, type: !71)
!77 = !DILocation(line: 92, column: 27, scope: !68)
!78 = !DILocation(line: 95, column: 22, scope: !68)
!79 = !DILocation(line: 95, column: 12, scope: !68)
!80 = !DILocation(line: 95, column: 5, scope: !68)
!81 = !DILocation(line: 97, column: 5, scope: !68)
!82 = !DILocation(line: 98, column: 5, scope: !68)
!83 = !DILocation(line: 99, column: 5, scope: !68)
!84 = !DILocation(line: 102, column: 5, scope: !68)
!85 = !DILocation(line: 103, column: 5, scope: !68)
!86 = !DILocation(line: 104, column: 5, scope: !68)
!87 = !DILocation(line: 106, column: 5, scope: !68)
!88 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 65, type: !34, scopeLine: 66, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!89 = !DILocalVariable(name: "data", scope: !88, file: !16, line: 67, type: !4)
!90 = !DILocation(line: 67, column: 15, scope: !88)
!91 = !DILocalVariable(name: "dataBadBuffer", scope: !88, file: !16, line: 68, type: !4)
!92 = !DILocation(line: 68, column: 15, scope: !88)
!93 = !DILocation(line: 68, column: 42, scope: !88)
!94 = !DILocation(line: 68, column: 31, scope: !88)
!95 = !DILocalVariable(name: "dataGoodBuffer", scope: !88, file: !16, line: 69, type: !4)
!96 = !DILocation(line: 69, column: 15, scope: !88)
!97 = !DILocation(line: 69, column: 43, scope: !88)
!98 = !DILocation(line: 69, column: 32, scope: !88)
!99 = !DILocation(line: 72, column: 12, scope: !88)
!100 = !DILocation(line: 72, column: 10, scope: !88)
!101 = !DILocation(line: 73, column: 5, scope: !88)
!102 = !DILocation(line: 73, column: 13, scope: !88)
!103 = !DILocation(line: 74, column: 82, scope: !88)
!104 = !DILocation(line: 74, column: 5, scope: !88)
!105 = !DILocation(line: 75, column: 1, scope: !88)
