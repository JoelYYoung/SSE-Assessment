; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_41.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_41.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_41_badSink(i8* %data) #0 !dbg !13 {
entry:
  %data.addr = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !19, metadata !DIExpression()), !dbg !24
  %0 = bitcast [50 x i8]* %dest to i8*, !dbg !24
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 50, i1 false), !dbg !24
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !25
  %1 = load i8*, i8** %data.addr, align 8, !dbg !26
  %call = call i64 @strlen(i8* %1) #6, !dbg !27
  %2 = load i8*, i8** %data.addr, align 8, !dbg !28
  %call1 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %arraydecay, i64 %call, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %2) #7, !dbg !29
  %3 = load i8*, i8** %data.addr, align 8, !dbg !30
  call void @printLine(i8* %3), !dbg !31
  ret void, !dbg !32
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i32 @snprintf(i8*, i64, i8*, ...) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #4

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_41_bad() #0 !dbg !33 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !36, metadata !DIExpression()), !dbg !37
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !38, metadata !DIExpression()), !dbg !39
  %0 = alloca i8, i64 100, align 16, !dbg !40
  store i8* %0, i8** %dataBuffer, align 8, !dbg !39
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !41
  store i8* %1, i8** %data, align 8, !dbg !42
  %2 = load i8*, i8** %data, align 8, !dbg !43
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !44
  %3 = load i8*, i8** %data, align 8, !dbg !45
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !45
  store i8 0, i8* %arrayidx, align 1, !dbg !46
  %4 = load i8*, i8** %data, align 8, !dbg !47
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_41_badSink(i8* %4), !dbg !48
  ret void, !dbg !49
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_41_goodG2BSink(i8* %data) #0 !dbg !50 {
entry:
  %data.addr = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !51, metadata !DIExpression()), !dbg !52
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !53, metadata !DIExpression()), !dbg !55
  %0 = bitcast [50 x i8]* %dest to i8*, !dbg !55
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 50, i1 false), !dbg !55
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !56
  %1 = load i8*, i8** %data.addr, align 8, !dbg !57
  %call = call i64 @strlen(i8* %1) #6, !dbg !58
  %2 = load i8*, i8** %data.addr, align 8, !dbg !59
  %call1 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %arraydecay, i64 %call, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %2) #7, !dbg !60
  %3 = load i8*, i8** %data.addr, align 8, !dbg !61
  call void @printLine(i8* %3), !dbg !62
  ret void, !dbg !63
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_41_good() #0 !dbg !64 {
entry:
  call void @goodG2B(), !dbg !65
  ret void, !dbg !66
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !67 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !72, metadata !DIExpression()), !dbg !73
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !74, metadata !DIExpression()), !dbg !75
  %call = call i64 @time(i64* null) #7, !dbg !76
  %conv = trunc i64 %call to i32, !dbg !77
  call void @srand(i32 %conv) #7, !dbg !78
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !79
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_41_good(), !dbg !80
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !81
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !82
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_41_bad(), !dbg !83
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !84
  ret i32 0, !dbg !85
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !86 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !87, metadata !DIExpression()), !dbg !88
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !89, metadata !DIExpression()), !dbg !90
  %0 = alloca i8, i64 100, align 16, !dbg !91
  store i8* %0, i8** %dataBuffer, align 8, !dbg !90
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !92
  store i8* %1, i8** %data, align 8, !dbg !93
  %2 = load i8*, i8** %data, align 8, !dbg !94
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !95
  %3 = load i8*, i8** %data, align 8, !dbg !96
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !96
  store i8 0, i8* %arrayidx, align 1, !dbg !97
  %4 = load i8*, i8** %data, align 8, !dbg !98
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_41_goodG2BSink(i8* %4), !dbg !99
  ret void, !dbg !100
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
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_41.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"uwtable", i32 1}
!11 = !{i32 7, !"frame-pointer", i32 2}
!12 = !{!"clang version 13.0.0"}
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_41_badSink", scope: !14, file: !14, line: 29, type: !15, scopeLine: 30, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_41.c", directory: "/root/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null, !4}
!17 = !DILocalVariable(name: "data", arg: 1, scope: !13, file: !14, line: 29, type: !4)
!18 = !DILocation(line: 29, column: 88, scope: !13)
!19 = !DILocalVariable(name: "dest", scope: !20, file: !14, line: 32, type: !21)
!20 = distinct !DILexicalBlock(scope: !13, file: !14, line: 31, column: 5)
!21 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 400, elements: !22)
!22 = !{!23}
!23 = !DISubrange(count: 50)
!24 = !DILocation(line: 32, column: 14, scope: !20)
!25 = !DILocation(line: 34, column: 18, scope: !20)
!26 = !DILocation(line: 34, column: 31, scope: !20)
!27 = !DILocation(line: 34, column: 24, scope: !20)
!28 = !DILocation(line: 34, column: 44, scope: !20)
!29 = !DILocation(line: 34, column: 9, scope: !20)
!30 = !DILocation(line: 35, column: 19, scope: !20)
!31 = !DILocation(line: 35, column: 9, scope: !20)
!32 = !DILocation(line: 37, column: 1, scope: !13)
!33 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_41_bad", scope: !14, file: !14, line: 39, type: !34, scopeLine: 40, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!34 = !DISubroutineType(types: !35)
!35 = !{null}
!36 = !DILocalVariable(name: "data", scope: !33, file: !14, line: 41, type: !4)
!37 = !DILocation(line: 41, column: 12, scope: !33)
!38 = !DILocalVariable(name: "dataBuffer", scope: !33, file: !14, line: 42, type: !4)
!39 = !DILocation(line: 42, column: 12, scope: !33)
!40 = !DILocation(line: 42, column: 33, scope: !33)
!41 = !DILocation(line: 43, column: 12, scope: !33)
!42 = !DILocation(line: 43, column: 10, scope: !33)
!43 = !DILocation(line: 45, column: 12, scope: !33)
!44 = !DILocation(line: 45, column: 5, scope: !33)
!45 = !DILocation(line: 46, column: 5, scope: !33)
!46 = !DILocation(line: 46, column: 17, scope: !33)
!47 = !DILocation(line: 47, column: 80, scope: !33)
!48 = !DILocation(line: 47, column: 5, scope: !33)
!49 = !DILocation(line: 48, column: 1, scope: !33)
!50 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_41_goodG2BSink", scope: !14, file: !14, line: 54, type: !15, scopeLine: 55, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!51 = !DILocalVariable(name: "data", arg: 1, scope: !50, file: !14, line: 54, type: !4)
!52 = !DILocation(line: 54, column: 92, scope: !50)
!53 = !DILocalVariable(name: "dest", scope: !54, file: !14, line: 57, type: !21)
!54 = distinct !DILexicalBlock(scope: !50, file: !14, line: 56, column: 5)
!55 = !DILocation(line: 57, column: 14, scope: !54)
!56 = !DILocation(line: 59, column: 18, scope: !54)
!57 = !DILocation(line: 59, column: 31, scope: !54)
!58 = !DILocation(line: 59, column: 24, scope: !54)
!59 = !DILocation(line: 59, column: 44, scope: !54)
!60 = !DILocation(line: 59, column: 9, scope: !54)
!61 = !DILocation(line: 60, column: 19, scope: !54)
!62 = !DILocation(line: 60, column: 9, scope: !54)
!63 = !DILocation(line: 62, column: 1, scope: !50)
!64 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_41_good", scope: !14, file: !14, line: 76, type: !34, scopeLine: 77, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!65 = !DILocation(line: 78, column: 5, scope: !64)
!66 = !DILocation(line: 79, column: 1, scope: !64)
!67 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 91, type: !68, scopeLine: 92, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!68 = !DISubroutineType(types: !69)
!69 = !{!70, !70, !71}
!70 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!71 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!72 = !DILocalVariable(name: "argc", arg: 1, scope: !67, file: !14, line: 91, type: !70)
!73 = !DILocation(line: 91, column: 14, scope: !67)
!74 = !DILocalVariable(name: "argv", arg: 2, scope: !67, file: !14, line: 91, type: !71)
!75 = !DILocation(line: 91, column: 27, scope: !67)
!76 = !DILocation(line: 94, column: 22, scope: !67)
!77 = !DILocation(line: 94, column: 12, scope: !67)
!78 = !DILocation(line: 94, column: 5, scope: !67)
!79 = !DILocation(line: 96, column: 5, scope: !67)
!80 = !DILocation(line: 97, column: 5, scope: !67)
!81 = !DILocation(line: 98, column: 5, scope: !67)
!82 = !DILocation(line: 101, column: 5, scope: !67)
!83 = !DILocation(line: 102, column: 5, scope: !67)
!84 = !DILocation(line: 103, column: 5, scope: !67)
!85 = !DILocation(line: 105, column: 5, scope: !67)
!86 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 65, type: !34, scopeLine: 66, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!87 = !DILocalVariable(name: "data", scope: !86, file: !14, line: 67, type: !4)
!88 = !DILocation(line: 67, column: 12, scope: !86)
!89 = !DILocalVariable(name: "dataBuffer", scope: !86, file: !14, line: 68, type: !4)
!90 = !DILocation(line: 68, column: 12, scope: !86)
!91 = !DILocation(line: 68, column: 33, scope: !86)
!92 = !DILocation(line: 69, column: 12, scope: !86)
!93 = !DILocation(line: 69, column: 10, scope: !86)
!94 = !DILocation(line: 71, column: 12, scope: !86)
!95 = !DILocation(line: 71, column: 5, scope: !86)
!96 = !DILocation(line: 72, column: 5, scope: !86)
!97 = !DILocation(line: 72, column: 16, scope: !86)
!98 = !DILocation(line: 73, column: 84, scope: !86)
!99 = !DILocation(line: 73, column: 5, scope: !86)
!100 = !DILocation(line: 74, column: 1, scope: !86)
