; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memmove_12.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memmove_12.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memmove_12_bad() #0 !dbg !13 {
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
  %8 = load i8*, i8** %data, align 8, !dbg !46
  %call2 = call i64 @strlen(i8* %8) #7, !dbg !47
  %mul = mul i64 %call2, 1, !dbg !48
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %arraydecay, i8* align 1 %7, i64 %mul, i1 false), !dbg !44
  %arrayidx3 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !49
  store i8 0, i8* %arrayidx3, align 1, !dbg !50
  %9 = load i8*, i8** %data, align 8, !dbg !51
  call void @printLine(i8* %9), !dbg !52
  ret void, !dbg !53
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @globalReturnsTrueOrFalse(...) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #4

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #5

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memmove_12_good() #0 !dbg !54 {
entry:
  call void @goodG2B(), !dbg !55
  ret void, !dbg !56
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !57 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !62, metadata !DIExpression()), !dbg !63
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !64, metadata !DIExpression()), !dbg !65
  %call = call i64 @time(i64* null) #8, !dbg !66
  %conv = trunc i64 %call to i32, !dbg !67
  call void @srand(i32 %conv) #8, !dbg !68
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !69
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memmove_12_good(), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !72
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memmove_12_bad(), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !74
  ret i32 0, !dbg !75
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #6

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !76 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !77, metadata !DIExpression()), !dbg !78
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !79, metadata !DIExpression()), !dbg !80
  %0 = alloca i8, i64 100, align 16, !dbg !81
  store i8* %0, i8** %dataBuffer, align 8, !dbg !80
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !82
  store i8* %1, i8** %data, align 8, !dbg !83
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !84
  %tobool = icmp ne i32 %call, 0, !dbg !84
  br i1 %tobool, label %if.then, label %if.else, !dbg !86

if.then:                                          ; preds = %entry
  %2 = load i8*, i8** %data, align 8, !dbg !87
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !89
  %3 = load i8*, i8** %data, align 8, !dbg !90
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !90
  store i8 0, i8* %arrayidx, align 1, !dbg !91
  br label %if.end, !dbg !92

if.else:                                          ; preds = %entry
  %4 = load i8*, i8** %data, align 8, !dbg !93
  call void @llvm.memset.p0i8.i64(i8* align 1 %4, i8 65, i64 49, i1 false), !dbg !95
  %5 = load i8*, i8** %data, align 8, !dbg !96
  %arrayidx1 = getelementptr inbounds i8, i8* %5, i64 49, !dbg !96
  store i8 0, i8* %arrayidx1, align 1, !dbg !97
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !98, metadata !DIExpression()), !dbg !100
  %6 = bitcast [50 x i8]* %dest to i8*, !dbg !100
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 50, i1 false), !dbg !100
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !101
  %7 = load i8*, i8** %data, align 8, !dbg !102
  %8 = load i8*, i8** %data, align 8, !dbg !103
  %call2 = call i64 @strlen(i8* %8) #7, !dbg !104
  %mul = mul i64 %call2, 1, !dbg !105
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %arraydecay, i8* align 1 %7, i64 %mul, i1 false), !dbg !101
  %arrayidx3 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !106
  store i8 0, i8* %arrayidx3, align 1, !dbg !107
  %9 = load i8*, i8** %data, align 8, !dbg !108
  call void @printLine(i8* %9), !dbg !109
  ret void, !dbg !110
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly nofree nounwind willreturn }
attributes #6 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind readonly willreturn }
attributes #8 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memmove_12.c", directory: "/root/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memmove_12_bad", scope: !14, file: !14, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memmove_12.c", directory: "/root/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 25, type: !4)
!18 = !DILocation(line: 25, column: 12, scope: !13)
!19 = !DILocalVariable(name: "dataBuffer", scope: !13, file: !14, line: 26, type: !4)
!20 = !DILocation(line: 26, column: 12, scope: !13)
!21 = !DILocation(line: 26, column: 33, scope: !13)
!22 = !DILocation(line: 27, column: 12, scope: !13)
!23 = !DILocation(line: 27, column: 10, scope: !13)
!24 = !DILocation(line: 28, column: 8, scope: !25)
!25 = distinct !DILexicalBlock(scope: !13, file: !14, line: 28, column: 8)
!26 = !DILocation(line: 28, column: 8, scope: !13)
!27 = !DILocation(line: 31, column: 16, scope: !28)
!28 = distinct !DILexicalBlock(scope: !25, file: !14, line: 29, column: 5)
!29 = !DILocation(line: 31, column: 9, scope: !28)
!30 = !DILocation(line: 32, column: 9, scope: !28)
!31 = !DILocation(line: 32, column: 21, scope: !28)
!32 = !DILocation(line: 33, column: 5, scope: !28)
!33 = !DILocation(line: 37, column: 16, scope: !34)
!34 = distinct !DILexicalBlock(scope: !25, file: !14, line: 35, column: 5)
!35 = !DILocation(line: 37, column: 9, scope: !34)
!36 = !DILocation(line: 38, column: 9, scope: !34)
!37 = !DILocation(line: 38, column: 20, scope: !34)
!38 = !DILocalVariable(name: "dest", scope: !39, file: !14, line: 41, type: !40)
!39 = distinct !DILexicalBlock(scope: !13, file: !14, line: 40, column: 5)
!40 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 400, elements: !41)
!41 = !{!42}
!42 = !DISubrange(count: 50)
!43 = !DILocation(line: 41, column: 14, scope: !39)
!44 = !DILocation(line: 43, column: 9, scope: !39)
!45 = !DILocation(line: 43, column: 23, scope: !39)
!46 = !DILocation(line: 43, column: 36, scope: !39)
!47 = !DILocation(line: 43, column: 29, scope: !39)
!48 = !DILocation(line: 43, column: 41, scope: !39)
!49 = !DILocation(line: 44, column: 9, scope: !39)
!50 = !DILocation(line: 44, column: 20, scope: !39)
!51 = !DILocation(line: 45, column: 19, scope: !39)
!52 = !DILocation(line: 45, column: 9, scope: !39)
!53 = !DILocation(line: 47, column: 1, scope: !13)
!54 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memmove_12_good", scope: !14, file: !14, line: 81, type: !15, scopeLine: 82, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!55 = !DILocation(line: 83, column: 5, scope: !54)
!56 = !DILocation(line: 84, column: 1, scope: !54)
!57 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 96, type: !58, scopeLine: 97, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!58 = !DISubroutineType(types: !59)
!59 = !{!60, !60, !61}
!60 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!62 = !DILocalVariable(name: "argc", arg: 1, scope: !57, file: !14, line: 96, type: !60)
!63 = !DILocation(line: 96, column: 14, scope: !57)
!64 = !DILocalVariable(name: "argv", arg: 2, scope: !57, file: !14, line: 96, type: !61)
!65 = !DILocation(line: 96, column: 27, scope: !57)
!66 = !DILocation(line: 99, column: 22, scope: !57)
!67 = !DILocation(line: 99, column: 12, scope: !57)
!68 = !DILocation(line: 99, column: 5, scope: !57)
!69 = !DILocation(line: 101, column: 5, scope: !57)
!70 = !DILocation(line: 102, column: 5, scope: !57)
!71 = !DILocation(line: 103, column: 5, scope: !57)
!72 = !DILocation(line: 106, column: 5, scope: !57)
!73 = !DILocation(line: 107, column: 5, scope: !57)
!74 = !DILocation(line: 108, column: 5, scope: !57)
!75 = !DILocation(line: 110, column: 5, scope: !57)
!76 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 55, type: !15, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!77 = !DILocalVariable(name: "data", scope: !76, file: !14, line: 57, type: !4)
!78 = !DILocation(line: 57, column: 12, scope: !76)
!79 = !DILocalVariable(name: "dataBuffer", scope: !76, file: !14, line: 58, type: !4)
!80 = !DILocation(line: 58, column: 12, scope: !76)
!81 = !DILocation(line: 58, column: 33, scope: !76)
!82 = !DILocation(line: 59, column: 12, scope: !76)
!83 = !DILocation(line: 59, column: 10, scope: !76)
!84 = !DILocation(line: 60, column: 8, scope: !85)
!85 = distinct !DILexicalBlock(scope: !76, file: !14, line: 60, column: 8)
!86 = !DILocation(line: 60, column: 8, scope: !76)
!87 = !DILocation(line: 63, column: 16, scope: !88)
!88 = distinct !DILexicalBlock(scope: !85, file: !14, line: 61, column: 5)
!89 = !DILocation(line: 63, column: 9, scope: !88)
!90 = !DILocation(line: 64, column: 9, scope: !88)
!91 = !DILocation(line: 64, column: 20, scope: !88)
!92 = !DILocation(line: 65, column: 5, scope: !88)
!93 = !DILocation(line: 69, column: 16, scope: !94)
!94 = distinct !DILexicalBlock(scope: !85, file: !14, line: 67, column: 5)
!95 = !DILocation(line: 69, column: 9, scope: !94)
!96 = !DILocation(line: 70, column: 9, scope: !94)
!97 = !DILocation(line: 70, column: 20, scope: !94)
!98 = !DILocalVariable(name: "dest", scope: !99, file: !14, line: 73, type: !40)
!99 = distinct !DILexicalBlock(scope: !76, file: !14, line: 72, column: 5)
!100 = !DILocation(line: 73, column: 14, scope: !99)
!101 = !DILocation(line: 75, column: 9, scope: !99)
!102 = !DILocation(line: 75, column: 23, scope: !99)
!103 = !DILocation(line: 75, column: 36, scope: !99)
!104 = !DILocation(line: 75, column: 29, scope: !99)
!105 = !DILocation(line: 75, column: 41, scope: !99)
!106 = !DILocation(line: 76, column: 9, scope: !99)
!107 = !DILocation(line: 76, column: 20, scope: !99)
!108 = !DILocation(line: 77, column: 19, scope: !99)
!109 = !DILocation(line: 77, column: 9, scope: !99)
!110 = !DILocation(line: 79, column: 1, scope: !76)
