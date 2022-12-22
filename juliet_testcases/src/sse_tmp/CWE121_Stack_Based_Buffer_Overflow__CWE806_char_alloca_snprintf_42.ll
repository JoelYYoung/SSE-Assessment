; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_42.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_42.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_42_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !19, metadata !DIExpression()), !dbg !20
  %0 = alloca i8, i64 100, align 16, !dbg !21
  store i8* %0, i8** %dataBuffer, align 8, !dbg !20
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !22
  store i8* %1, i8** %data, align 8, !dbg !23
  %2 = load i8*, i8** %data, align 8, !dbg !24
  %call = call i8* @badSource(i8* %2), !dbg !25
  store i8* %call, i8** %data, align 8, !dbg !26
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !27, metadata !DIExpression()), !dbg !32
  %3 = bitcast [50 x i8]* %dest to i8*, !dbg !32
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 50, i1 false), !dbg !32
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !33
  %4 = load i8*, i8** %data, align 8, !dbg !34
  %call1 = call i64 @strlen(i8* %4) #6, !dbg !35
  %5 = load i8*, i8** %data, align 8, !dbg !36
  %call2 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %arraydecay, i64 %call1, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %5) #7, !dbg !37
  %6 = load i8*, i8** %data, align 8, !dbg !38
  call void @printLine(i8* %6), !dbg !39
  ret void, !dbg !40
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal i8* @badSource(i8* %data) #0 !dbg !41 {
entry:
  %data.addr = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !44, metadata !DIExpression()), !dbg !45
  %0 = load i8*, i8** %data.addr, align 8, !dbg !46
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 65, i64 99, i1 false), !dbg !47
  %1 = load i8*, i8** %data.addr, align 8, !dbg !48
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 99, !dbg !48
  store i8 0, i8* %arrayidx, align 1, !dbg !49
  %2 = load i8*, i8** %data.addr, align 8, !dbg !50
  ret i8* %2, !dbg !51
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i32 @snprintf(i8*, i64, i8*, ...) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #4

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_42_good() #0 !dbg !52 {
entry:
  call void @goodG2B(), !dbg !53
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !60, metadata !DIExpression()), !dbg !61
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !62, metadata !DIExpression()), !dbg !63
  %call = call i64 @time(i64* null) #7, !dbg !64
  %conv = trunc i64 %call to i32, !dbg !65
  call void @srand(i32 %conv) #7, !dbg !66
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !67
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_42_good(), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !70
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_42_bad(), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !72
  ret i32 0, !dbg !73
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !74 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !75, metadata !DIExpression()), !dbg !76
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !77, metadata !DIExpression()), !dbg !78
  %0 = alloca i8, i64 100, align 16, !dbg !79
  store i8* %0, i8** %dataBuffer, align 8, !dbg !78
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !80
  store i8* %1, i8** %data, align 8, !dbg !81
  %2 = load i8*, i8** %data, align 8, !dbg !82
  %call = call i8* @goodG2BSource(i8* %2), !dbg !83
  store i8* %call, i8** %data, align 8, !dbg !84
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !85, metadata !DIExpression()), !dbg !87
  %3 = bitcast [50 x i8]* %dest to i8*, !dbg !87
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 50, i1 false), !dbg !87
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !88
  %4 = load i8*, i8** %data, align 8, !dbg !89
  %call1 = call i64 @strlen(i8* %4) #6, !dbg !90
  %5 = load i8*, i8** %data, align 8, !dbg !91
  %call2 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %arraydecay, i64 %call1, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %5) #7, !dbg !92
  %6 = load i8*, i8** %data, align 8, !dbg !93
  call void @printLine(i8* %6), !dbg !94
  ret void, !dbg !95
}

; Function Attrs: noinline nounwind uwtable
define internal i8* @goodG2BSource(i8* %data) #0 !dbg !96 {
entry:
  %data.addr = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !97, metadata !DIExpression()), !dbg !98
  %0 = load i8*, i8** %data.addr, align 8, !dbg !99
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 65, i64 49, i1 false), !dbg !100
  %1 = load i8*, i8** %data.addr, align 8, !dbg !101
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 49, !dbg !101
  store i8 0, i8* %arrayidx, align 1, !dbg !102
  %2 = load i8*, i8** %data.addr, align 8, !dbg !103
  ret i8* %2, !dbg !104
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_42.c", directory: "/root/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_42_bad", scope: !14, file: !14, line: 37, type: !15, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_42.c", directory: "/root/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 39, type: !4)
!18 = !DILocation(line: 39, column: 12, scope: !13)
!19 = !DILocalVariable(name: "dataBuffer", scope: !13, file: !14, line: 40, type: !4)
!20 = !DILocation(line: 40, column: 12, scope: !13)
!21 = !DILocation(line: 40, column: 33, scope: !13)
!22 = !DILocation(line: 41, column: 12, scope: !13)
!23 = !DILocation(line: 41, column: 10, scope: !13)
!24 = !DILocation(line: 42, column: 22, scope: !13)
!25 = !DILocation(line: 42, column: 12, scope: !13)
!26 = !DILocation(line: 42, column: 10, scope: !13)
!27 = !DILocalVariable(name: "dest", scope: !28, file: !14, line: 44, type: !29)
!28 = distinct !DILexicalBlock(scope: !13, file: !14, line: 43, column: 5)
!29 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 400, elements: !30)
!30 = !{!31}
!31 = !DISubrange(count: 50)
!32 = !DILocation(line: 44, column: 14, scope: !28)
!33 = !DILocation(line: 46, column: 18, scope: !28)
!34 = !DILocation(line: 46, column: 31, scope: !28)
!35 = !DILocation(line: 46, column: 24, scope: !28)
!36 = !DILocation(line: 46, column: 44, scope: !28)
!37 = !DILocation(line: 46, column: 9, scope: !28)
!38 = !DILocation(line: 47, column: 19, scope: !28)
!39 = !DILocation(line: 47, column: 9, scope: !28)
!40 = !DILocation(line: 49, column: 1, scope: !13)
!41 = distinct !DISubprogram(name: "badSource", scope: !14, file: !14, line: 29, type: !42, scopeLine: 30, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!42 = !DISubroutineType(types: !43)
!43 = !{!4, !4}
!44 = !DILocalVariable(name: "data", arg: 1, scope: !41, file: !14, line: 29, type: !4)
!45 = !DILocation(line: 29, column: 32, scope: !41)
!46 = !DILocation(line: 32, column: 12, scope: !41)
!47 = !DILocation(line: 32, column: 5, scope: !41)
!48 = !DILocation(line: 33, column: 5, scope: !41)
!49 = !DILocation(line: 33, column: 17, scope: !41)
!50 = !DILocation(line: 34, column: 12, scope: !41)
!51 = !DILocation(line: 34, column: 5, scope: !41)
!52 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_42_good", scope: !14, file: !14, line: 78, type: !15, scopeLine: 79, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!53 = !DILocation(line: 80, column: 5, scope: !52)
!54 = !DILocation(line: 81, column: 1, scope: !52)
!55 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 93, type: !56, scopeLine: 94, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!56 = !DISubroutineType(types: !57)
!57 = !{!58, !58, !59}
!58 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!60 = !DILocalVariable(name: "argc", arg: 1, scope: !55, file: !14, line: 93, type: !58)
!61 = !DILocation(line: 93, column: 14, scope: !55)
!62 = !DILocalVariable(name: "argv", arg: 2, scope: !55, file: !14, line: 93, type: !59)
!63 = !DILocation(line: 93, column: 27, scope: !55)
!64 = !DILocation(line: 96, column: 22, scope: !55)
!65 = !DILocation(line: 96, column: 12, scope: !55)
!66 = !DILocation(line: 96, column: 5, scope: !55)
!67 = !DILocation(line: 98, column: 5, scope: !55)
!68 = !DILocation(line: 99, column: 5, scope: !55)
!69 = !DILocation(line: 100, column: 5, scope: !55)
!70 = !DILocation(line: 103, column: 5, scope: !55)
!71 = !DILocation(line: 104, column: 5, scope: !55)
!72 = !DILocation(line: 105, column: 5, scope: !55)
!73 = !DILocation(line: 107, column: 5, scope: !55)
!74 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 64, type: !15, scopeLine: 65, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!75 = !DILocalVariable(name: "data", scope: !74, file: !14, line: 66, type: !4)
!76 = !DILocation(line: 66, column: 12, scope: !74)
!77 = !DILocalVariable(name: "dataBuffer", scope: !74, file: !14, line: 67, type: !4)
!78 = !DILocation(line: 67, column: 12, scope: !74)
!79 = !DILocation(line: 67, column: 33, scope: !74)
!80 = !DILocation(line: 68, column: 12, scope: !74)
!81 = !DILocation(line: 68, column: 10, scope: !74)
!82 = !DILocation(line: 69, column: 26, scope: !74)
!83 = !DILocation(line: 69, column: 12, scope: !74)
!84 = !DILocation(line: 69, column: 10, scope: !74)
!85 = !DILocalVariable(name: "dest", scope: !86, file: !14, line: 71, type: !29)
!86 = distinct !DILexicalBlock(scope: !74, file: !14, line: 70, column: 5)
!87 = !DILocation(line: 71, column: 14, scope: !86)
!88 = !DILocation(line: 73, column: 18, scope: !86)
!89 = !DILocation(line: 73, column: 31, scope: !86)
!90 = !DILocation(line: 73, column: 24, scope: !86)
!91 = !DILocation(line: 73, column: 44, scope: !86)
!92 = !DILocation(line: 73, column: 9, scope: !86)
!93 = !DILocation(line: 74, column: 19, scope: !86)
!94 = !DILocation(line: 74, column: 9, scope: !86)
!95 = !DILocation(line: 76, column: 1, scope: !74)
!96 = distinct !DISubprogram(name: "goodG2BSource", scope: !14, file: !14, line: 55, type: !42, scopeLine: 56, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!97 = !DILocalVariable(name: "data", arg: 1, scope: !96, file: !14, line: 55, type: !4)
!98 = !DILocation(line: 55, column: 36, scope: !96)
!99 = !DILocation(line: 58, column: 12, scope: !96)
!100 = !DILocation(line: 58, column: 5, scope: !96)
!101 = !DILocation(line: 59, column: 5, scope: !96)
!102 = !DILocation(line: 59, column: 16, scope: !96)
!103 = !DILocation(line: 60, column: 12, scope: !96)
!104 = !DILocation(line: 60, column: 5, scope: !96)
