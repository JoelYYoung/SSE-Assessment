; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_12.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_12.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_12_bad() #0 !dbg !13 {
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
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !24
  %tobool = icmp ne i32 %call, 0, !dbg !24
  br i1 %tobool, label %if.then, label %if.else, !dbg !26

if.then:                                          ; preds = %entry
  %2 = load i8*, i8** %data, align 8, !dbg !27
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !29
  %3 = load i8*, i8** %data, align 8, !dbg !30
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !30
  store i8 0, i8* %arrayidx, align 1, !dbg !31
  br label %if.end, !dbg !32

if.else:                                          ; preds = %entry
  %4 = load i8*, i8** %data, align 8, !dbg !33
  call void @llvm.memset.p0i8.i64(i8* align 1 %4, i8 65, i64 49, i1 false), !dbg !35
  %5 = load i8*, i8** %data, align 8, !dbg !36
  %arrayidx1 = getelementptr inbounds i8, i8* %5, i64 49, !dbg !36
  store i8 0, i8* %arrayidx1, align 1, !dbg !37
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !38, metadata !DIExpression()), !dbg !43
  %6 = bitcast [50 x i8]* %dest to i8*, !dbg !43
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 50, i1 false), !dbg !43
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !44
  %7 = load i8*, i8** %data, align 8, !dbg !45
  %call2 = call i64 @strlen(i8* %7) #6, !dbg !46
  %8 = load i8*, i8** %data, align 8, !dbg !47
  %call3 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %arraydecay, i64 %call2, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %8) #7, !dbg !48
  %9 = load i8*, i8** %data, align 8, !dbg !49
  call void @printLine(i8* %9), !dbg !50
  ret void, !dbg !51
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @globalReturnsTrueOrFalse(...) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind
declare dso_local i32 @snprintf(i8*, i64, i8*, ...) #4

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #5

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_12_good() #0 !dbg !52 {
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
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_12_good(), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !70
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_12_bad(), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !72
  ret i32 0, !dbg !73
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

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
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !82
  %tobool = icmp ne i32 %call, 0, !dbg !82
  br i1 %tobool, label %if.then, label %if.else, !dbg !84

if.then:                                          ; preds = %entry
  %2 = load i8*, i8** %data, align 8, !dbg !85
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !87
  %3 = load i8*, i8** %data, align 8, !dbg !88
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !88
  store i8 0, i8* %arrayidx, align 1, !dbg !89
  br label %if.end, !dbg !90

if.else:                                          ; preds = %entry
  %4 = load i8*, i8** %data, align 8, !dbg !91
  call void @llvm.memset.p0i8.i64(i8* align 1 %4, i8 65, i64 49, i1 false), !dbg !93
  %5 = load i8*, i8** %data, align 8, !dbg !94
  %arrayidx1 = getelementptr inbounds i8, i8* %5, i64 49, !dbg !94
  store i8 0, i8* %arrayidx1, align 1, !dbg !95
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !96, metadata !DIExpression()), !dbg !98
  %6 = bitcast [50 x i8]* %dest to i8*, !dbg !98
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 50, i1 false), !dbg !98
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !99
  %7 = load i8*, i8** %data, align 8, !dbg !100
  %call2 = call i64 @strlen(i8* %7) #6, !dbg !101
  %8 = load i8*, i8** %data, align 8, !dbg !102
  %call3 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %arraydecay, i64 %call2, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %8) #7, !dbg !103
  %9 = load i8*, i8** %data, align 8, !dbg !104
  call void @printLine(i8* %9), !dbg !105
  ret void, !dbg !106
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_12.c", directory: "/root/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_12_bad", scope: !14, file: !14, line: 29, type: !15, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_12.c", directory: "/root/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 31, type: !4)
!18 = !DILocation(line: 31, column: 12, scope: !13)
!19 = !DILocalVariable(name: "dataBuffer", scope: !13, file: !14, line: 32, type: !4)
!20 = !DILocation(line: 32, column: 12, scope: !13)
!21 = !DILocation(line: 32, column: 33, scope: !13)
!22 = !DILocation(line: 33, column: 12, scope: !13)
!23 = !DILocation(line: 33, column: 10, scope: !13)
!24 = !DILocation(line: 34, column: 8, scope: !25)
!25 = distinct !DILexicalBlock(scope: !13, file: !14, line: 34, column: 8)
!26 = !DILocation(line: 34, column: 8, scope: !13)
!27 = !DILocation(line: 37, column: 16, scope: !28)
!28 = distinct !DILexicalBlock(scope: !25, file: !14, line: 35, column: 5)
!29 = !DILocation(line: 37, column: 9, scope: !28)
!30 = !DILocation(line: 38, column: 9, scope: !28)
!31 = !DILocation(line: 38, column: 21, scope: !28)
!32 = !DILocation(line: 39, column: 5, scope: !28)
!33 = !DILocation(line: 43, column: 16, scope: !34)
!34 = distinct !DILexicalBlock(scope: !25, file: !14, line: 41, column: 5)
!35 = !DILocation(line: 43, column: 9, scope: !34)
!36 = !DILocation(line: 44, column: 9, scope: !34)
!37 = !DILocation(line: 44, column: 20, scope: !34)
!38 = !DILocalVariable(name: "dest", scope: !39, file: !14, line: 47, type: !40)
!39 = distinct !DILexicalBlock(scope: !13, file: !14, line: 46, column: 5)
!40 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 400, elements: !41)
!41 = !{!42}
!42 = !DISubrange(count: 50)
!43 = !DILocation(line: 47, column: 14, scope: !39)
!44 = !DILocation(line: 49, column: 18, scope: !39)
!45 = !DILocation(line: 49, column: 31, scope: !39)
!46 = !DILocation(line: 49, column: 24, scope: !39)
!47 = !DILocation(line: 49, column: 44, scope: !39)
!48 = !DILocation(line: 49, column: 9, scope: !39)
!49 = !DILocation(line: 50, column: 19, scope: !39)
!50 = !DILocation(line: 50, column: 9, scope: !39)
!51 = !DILocation(line: 52, column: 1, scope: !13)
!52 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_12_good", scope: !14, file: !14, line: 85, type: !15, scopeLine: 86, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!53 = !DILocation(line: 87, column: 5, scope: !52)
!54 = !DILocation(line: 88, column: 1, scope: !52)
!55 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 100, type: !56, scopeLine: 101, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!56 = !DISubroutineType(types: !57)
!57 = !{!58, !58, !59}
!58 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!60 = !DILocalVariable(name: "argc", arg: 1, scope: !55, file: !14, line: 100, type: !58)
!61 = !DILocation(line: 100, column: 14, scope: !55)
!62 = !DILocalVariable(name: "argv", arg: 2, scope: !55, file: !14, line: 100, type: !59)
!63 = !DILocation(line: 100, column: 27, scope: !55)
!64 = !DILocation(line: 103, column: 22, scope: !55)
!65 = !DILocation(line: 103, column: 12, scope: !55)
!66 = !DILocation(line: 103, column: 5, scope: !55)
!67 = !DILocation(line: 105, column: 5, scope: !55)
!68 = !DILocation(line: 106, column: 5, scope: !55)
!69 = !DILocation(line: 107, column: 5, scope: !55)
!70 = !DILocation(line: 110, column: 5, scope: !55)
!71 = !DILocation(line: 111, column: 5, scope: !55)
!72 = !DILocation(line: 112, column: 5, scope: !55)
!73 = !DILocation(line: 114, column: 5, scope: !55)
!74 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 60, type: !15, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!75 = !DILocalVariable(name: "data", scope: !74, file: !14, line: 62, type: !4)
!76 = !DILocation(line: 62, column: 12, scope: !74)
!77 = !DILocalVariable(name: "dataBuffer", scope: !74, file: !14, line: 63, type: !4)
!78 = !DILocation(line: 63, column: 12, scope: !74)
!79 = !DILocation(line: 63, column: 33, scope: !74)
!80 = !DILocation(line: 64, column: 12, scope: !74)
!81 = !DILocation(line: 64, column: 10, scope: !74)
!82 = !DILocation(line: 65, column: 8, scope: !83)
!83 = distinct !DILexicalBlock(scope: !74, file: !14, line: 65, column: 8)
!84 = !DILocation(line: 65, column: 8, scope: !74)
!85 = !DILocation(line: 68, column: 16, scope: !86)
!86 = distinct !DILexicalBlock(scope: !83, file: !14, line: 66, column: 5)
!87 = !DILocation(line: 68, column: 9, scope: !86)
!88 = !DILocation(line: 69, column: 9, scope: !86)
!89 = !DILocation(line: 69, column: 20, scope: !86)
!90 = !DILocation(line: 70, column: 5, scope: !86)
!91 = !DILocation(line: 74, column: 16, scope: !92)
!92 = distinct !DILexicalBlock(scope: !83, file: !14, line: 72, column: 5)
!93 = !DILocation(line: 74, column: 9, scope: !92)
!94 = !DILocation(line: 75, column: 9, scope: !92)
!95 = !DILocation(line: 75, column: 20, scope: !92)
!96 = !DILocalVariable(name: "dest", scope: !97, file: !14, line: 78, type: !40)
!97 = distinct !DILexicalBlock(scope: !74, file: !14, line: 77, column: 5)
!98 = !DILocation(line: 78, column: 14, scope: !97)
!99 = !DILocation(line: 80, column: 18, scope: !97)
!100 = !DILocation(line: 80, column: 31, scope: !97)
!101 = !DILocation(line: 80, column: 24, scope: !97)
!102 = !DILocation(line: 80, column: 44, scope: !97)
!103 = !DILocation(line: 80, column: 9, scope: !97)
!104 = !DILocation(line: 81, column: 19, scope: !97)
!105 = !DILocation(line: 81, column: 9, scope: !97)
!106 = !DILocation(line: 83, column: 1, scope: !74)
