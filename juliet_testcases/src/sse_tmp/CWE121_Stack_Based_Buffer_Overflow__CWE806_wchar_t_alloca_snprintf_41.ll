; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_41.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_41.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [3 x i32] [i32 37, i32 115, i32 0], align 4
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_41_badSink(i32* %data) #0 !dbg !15 {
entry:
  %data.addr = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !21, metadata !DIExpression()), !dbg !26
  %0 = bitcast [50 x i32]* %dest to i8*, !dbg !26
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 200, i1 false), !dbg !26
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !27
  %1 = load i32*, i32** %data.addr, align 8, !dbg !28
  %call = call i64 @wcslen(i32* %1) #6, !dbg !29
  %2 = load i32*, i32** %data.addr, align 8, !dbg !30
  %call1 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %arraydecay, i64 %call, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %2) #7, !dbg !31
  %3 = load i32*, i32** %data.addr, align 8, !dbg !32
  call void @printWLine(i32* %3), !dbg !33
  ret void, !dbg !34
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i32 @swprintf(i32*, i64, i32*, ...) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #4

declare dso_local void @printWLine(i32*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_41_bad() #0 !dbg !35 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !38, metadata !DIExpression()), !dbg !39
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !40, metadata !DIExpression()), !dbg !41
  %0 = alloca i8, i64 400, align 16, !dbg !42
  %1 = bitcast i8* %0 to i32*, !dbg !43
  store i32* %1, i32** %dataBuffer, align 8, !dbg !41
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !44
  store i32* %2, i32** %data, align 8, !dbg !45
  %3 = load i32*, i32** %data, align 8, !dbg !46
  %call = call i32* @wmemset(i32* %3, i32 65, i64 99) #7, !dbg !47
  %4 = load i32*, i32** %data, align 8, !dbg !48
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !48
  store i32 0, i32* %arrayidx, align 4, !dbg !49
  %5 = load i32*, i32** %data, align 8, !dbg !50
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_41_badSink(i32* %5), !dbg !51
  ret void, !dbg !52
}

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_41_goodG2BSink(i32* %data) #0 !dbg !53 {
entry:
  %data.addr = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !54, metadata !DIExpression()), !dbg !55
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !56, metadata !DIExpression()), !dbg !58
  %0 = bitcast [50 x i32]* %dest to i8*, !dbg !58
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 200, i1 false), !dbg !58
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !59
  %1 = load i32*, i32** %data.addr, align 8, !dbg !60
  %call = call i64 @wcslen(i32* %1) #6, !dbg !61
  %2 = load i32*, i32** %data.addr, align 8, !dbg !62
  %call1 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %arraydecay, i64 %call, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %2) #7, !dbg !63
  %3 = load i32*, i32** %data.addr, align 8, !dbg !64
  call void @printWLine(i32* %3), !dbg !65
  ret void, !dbg !66
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_41_good() #0 !dbg !67 {
entry:
  call void @goodG2B(), !dbg !68
  ret void, !dbg !69
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !70 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !76, metadata !DIExpression()), !dbg !77
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !78, metadata !DIExpression()), !dbg !79
  %call = call i64 @time(i64* null) #7, !dbg !80
  %conv = trunc i64 %call to i32, !dbg !81
  call void @srand(i32 %conv) #7, !dbg !82
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !83
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_41_good(), !dbg !84
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !85
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !86
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_41_bad(), !dbg !87
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !88
  ret i32 0, !dbg !89
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !90 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !91, metadata !DIExpression()), !dbg !92
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !93, metadata !DIExpression()), !dbg !94
  %0 = alloca i8, i64 400, align 16, !dbg !95
  %1 = bitcast i8* %0 to i32*, !dbg !96
  store i32* %1, i32** %dataBuffer, align 8, !dbg !94
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !97
  store i32* %2, i32** %data, align 8, !dbg !98
  %3 = load i32*, i32** %data, align 8, !dbg !99
  %call = call i32* @wmemset(i32* %3, i32 65, i64 49) #7, !dbg !100
  %4 = load i32*, i32** %data, align 8, !dbg !101
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 49, !dbg !101
  store i32 0, i32* %arrayidx, align 4, !dbg !102
  %5 = load i32*, i32** %data, align 8, !dbg !103
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_41_goodG2BSink(i32* %5), !dbg !104
  ret void, !dbg !105
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_41.c", directory: "/root/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_41_badSink", scope: !16, file: !16, line: 29, type: !17, scopeLine: 30, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_41.c", directory: "/root/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null, !4}
!19 = !DILocalVariable(name: "data", arg: 1, scope: !15, file: !16, line: 29, type: !4)
!20 = !DILocation(line: 29, column: 94, scope: !15)
!21 = !DILocalVariable(name: "dest", scope: !22, file: !16, line: 32, type: !23)
!22 = distinct !DILexicalBlock(scope: !15, file: !16, line: 31, column: 5)
!23 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 1600, elements: !24)
!24 = !{!25}
!25 = !DISubrange(count: 50)
!26 = !DILocation(line: 32, column: 17, scope: !22)
!27 = !DILocation(line: 34, column: 18, scope: !22)
!28 = !DILocation(line: 34, column: 31, scope: !22)
!29 = !DILocation(line: 34, column: 24, scope: !22)
!30 = !DILocation(line: 34, column: 45, scope: !22)
!31 = !DILocation(line: 34, column: 9, scope: !22)
!32 = !DILocation(line: 35, column: 20, scope: !22)
!33 = !DILocation(line: 35, column: 9, scope: !22)
!34 = !DILocation(line: 37, column: 1, scope: !15)
!35 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_41_bad", scope: !16, file: !16, line: 39, type: !36, scopeLine: 40, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!36 = !DISubroutineType(types: !37)
!37 = !{null}
!38 = !DILocalVariable(name: "data", scope: !35, file: !16, line: 41, type: !4)
!39 = !DILocation(line: 41, column: 15, scope: !35)
!40 = !DILocalVariable(name: "dataBuffer", scope: !35, file: !16, line: 42, type: !4)
!41 = !DILocation(line: 42, column: 15, scope: !35)
!42 = !DILocation(line: 42, column: 39, scope: !35)
!43 = !DILocation(line: 42, column: 28, scope: !35)
!44 = !DILocation(line: 43, column: 12, scope: !35)
!45 = !DILocation(line: 43, column: 10, scope: !35)
!46 = !DILocation(line: 45, column: 13, scope: !35)
!47 = !DILocation(line: 45, column: 5, scope: !35)
!48 = !DILocation(line: 46, column: 5, scope: !35)
!49 = !DILocation(line: 46, column: 17, scope: !35)
!50 = !DILocation(line: 47, column: 83, scope: !35)
!51 = !DILocation(line: 47, column: 5, scope: !35)
!52 = !DILocation(line: 48, column: 1, scope: !35)
!53 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_41_goodG2BSink", scope: !16, file: !16, line: 54, type: !17, scopeLine: 55, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!54 = !DILocalVariable(name: "data", arg: 1, scope: !53, file: !16, line: 54, type: !4)
!55 = !DILocation(line: 54, column: 98, scope: !53)
!56 = !DILocalVariable(name: "dest", scope: !57, file: !16, line: 57, type: !23)
!57 = distinct !DILexicalBlock(scope: !53, file: !16, line: 56, column: 5)
!58 = !DILocation(line: 57, column: 17, scope: !57)
!59 = !DILocation(line: 59, column: 18, scope: !57)
!60 = !DILocation(line: 59, column: 31, scope: !57)
!61 = !DILocation(line: 59, column: 24, scope: !57)
!62 = !DILocation(line: 59, column: 45, scope: !57)
!63 = !DILocation(line: 59, column: 9, scope: !57)
!64 = !DILocation(line: 60, column: 20, scope: !57)
!65 = !DILocation(line: 60, column: 9, scope: !57)
!66 = !DILocation(line: 62, column: 1, scope: !53)
!67 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_41_good", scope: !16, file: !16, line: 76, type: !36, scopeLine: 77, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!68 = !DILocation(line: 78, column: 5, scope: !67)
!69 = !DILocation(line: 79, column: 1, scope: !67)
!70 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 91, type: !71, scopeLine: 92, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!71 = !DISubroutineType(types: !72)
!72 = !{!7, !7, !73}
!73 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !74, size: 64)
!74 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !75, size: 64)
!75 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!76 = !DILocalVariable(name: "argc", arg: 1, scope: !70, file: !16, line: 91, type: !7)
!77 = !DILocation(line: 91, column: 14, scope: !70)
!78 = !DILocalVariable(name: "argv", arg: 2, scope: !70, file: !16, line: 91, type: !73)
!79 = !DILocation(line: 91, column: 27, scope: !70)
!80 = !DILocation(line: 94, column: 22, scope: !70)
!81 = !DILocation(line: 94, column: 12, scope: !70)
!82 = !DILocation(line: 94, column: 5, scope: !70)
!83 = !DILocation(line: 96, column: 5, scope: !70)
!84 = !DILocation(line: 97, column: 5, scope: !70)
!85 = !DILocation(line: 98, column: 5, scope: !70)
!86 = !DILocation(line: 101, column: 5, scope: !70)
!87 = !DILocation(line: 102, column: 5, scope: !70)
!88 = !DILocation(line: 103, column: 5, scope: !70)
!89 = !DILocation(line: 105, column: 5, scope: !70)
!90 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 65, type: !36, scopeLine: 66, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!91 = !DILocalVariable(name: "data", scope: !90, file: !16, line: 67, type: !4)
!92 = !DILocation(line: 67, column: 15, scope: !90)
!93 = !DILocalVariable(name: "dataBuffer", scope: !90, file: !16, line: 68, type: !4)
!94 = !DILocation(line: 68, column: 15, scope: !90)
!95 = !DILocation(line: 68, column: 39, scope: !90)
!96 = !DILocation(line: 68, column: 28, scope: !90)
!97 = !DILocation(line: 69, column: 12, scope: !90)
!98 = !DILocation(line: 69, column: 10, scope: !90)
!99 = !DILocation(line: 71, column: 13, scope: !90)
!100 = !DILocation(line: 71, column: 5, scope: !90)
!101 = !DILocation(line: 72, column: 5, scope: !90)
!102 = !DILocation(line: 72, column: 16, scope: !90)
!103 = !DILocation(line: 73, column: 87, scope: !90)
!104 = !DILocation(line: 73, column: 5, scope: !90)
!105 = !DILocation(line: 74, column: 1, scope: !90)
