; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_08.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_08.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_08_bad() #0 !dbg !13 {
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
  %call = call i32 @staticReturnsTrue(), !dbg !24
  %tobool = icmp ne i32 %call, 0, !dbg !24
  br i1 %tobool, label %if.then, label %if.end, !dbg !26

if.then:                                          ; preds = %entry
  %2 = load i8*, i8** %data, align 8, !dbg !27
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !29
  %3 = load i8*, i8** %data, align 8, !dbg !30
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !30
  store i8 0, i8* %arrayidx, align 1, !dbg !31
  br label %if.end, !dbg !32

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !33, metadata !DIExpression()), !dbg !38
  %4 = bitcast [50 x i8]* %dest to i8*, !dbg !38
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 50, i1 false), !dbg !38
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !39
  %5 = load i8*, i8** %data, align 8, !dbg !40
  %call1 = call i64 @strlen(i8* %5) #6, !dbg !41
  %6 = load i8*, i8** %data, align 8, !dbg !42
  %call2 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %arraydecay, i64 %call1, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %6) #7, !dbg !43
  %7 = load i8*, i8** %data, align 8, !dbg !44
  call void @printLine(i8* %7), !dbg !45
  ret void, !dbg !46
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
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_08_good() #0 !dbg !47 {
entry:
  call void @goodG2B1(), !dbg !48
  call void @goodG2B2(), !dbg !49
  ret void, !dbg !50
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !51 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !56, metadata !DIExpression()), !dbg !57
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !58, metadata !DIExpression()), !dbg !59
  %call = call i64 @time(i64* null) #7, !dbg !60
  %conv = trunc i64 %call to i32, !dbg !61
  call void @srand(i32 %conv) #7, !dbg !62
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !63
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_08_good(), !dbg !64
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !65
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !66
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_08_bad(), !dbg !67
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !68
  ret i32 0, !dbg !69
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !70 {
entry:
  ret i32 1, !dbg !73
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !74 {
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
  %call = call i32 @staticReturnsFalse(), !dbg !82
  %tobool = icmp ne i32 %call, 0, !dbg !82
  br i1 %tobool, label %if.then, label %if.else, !dbg !84

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !85
  br label %if.end, !dbg !87

if.else:                                          ; preds = %entry
  %2 = load i8*, i8** %data, align 8, !dbg !88
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !90
  %3 = load i8*, i8** %data, align 8, !dbg !91
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !91
  store i8 0, i8* %arrayidx, align 1, !dbg !92
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !93, metadata !DIExpression()), !dbg !95
  %4 = bitcast [50 x i8]* %dest to i8*, !dbg !95
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 50, i1 false), !dbg !95
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !96
  %5 = load i8*, i8** %data, align 8, !dbg !97
  %call1 = call i64 @strlen(i8* %5) #6, !dbg !98
  %6 = load i8*, i8** %data, align 8, !dbg !99
  %call2 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %arraydecay, i64 %call1, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %6) #7, !dbg !100
  %7 = load i8*, i8** %data, align 8, !dbg !101
  call void @printLine(i8* %7), !dbg !102
  ret void, !dbg !103
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !104 {
entry:
  ret i32 0, !dbg !105
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !106 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !107, metadata !DIExpression()), !dbg !108
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !109, metadata !DIExpression()), !dbg !110
  %0 = alloca i8, i64 100, align 16, !dbg !111
  store i8* %0, i8** %dataBuffer, align 8, !dbg !110
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !112
  store i8* %1, i8** %data, align 8, !dbg !113
  %call = call i32 @staticReturnsTrue(), !dbg !114
  %tobool = icmp ne i32 %call, 0, !dbg !114
  br i1 %tobool, label %if.then, label %if.end, !dbg !116

if.then:                                          ; preds = %entry
  %2 = load i8*, i8** %data, align 8, !dbg !117
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !119
  %3 = load i8*, i8** %data, align 8, !dbg !120
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !120
  store i8 0, i8* %arrayidx, align 1, !dbg !121
  br label %if.end, !dbg !122

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !123, metadata !DIExpression()), !dbg !125
  %4 = bitcast [50 x i8]* %dest to i8*, !dbg !125
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 50, i1 false), !dbg !125
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !126
  %5 = load i8*, i8** %data, align 8, !dbg !127
  %call1 = call i64 @strlen(i8* %5) #6, !dbg !128
  %6 = load i8*, i8** %data, align 8, !dbg !129
  %call2 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %arraydecay, i64 %call1, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %6) #7, !dbg !130
  %7 = load i8*, i8** %data, align 8, !dbg !131
  call void @printLine(i8* %7), !dbg !132
  ret void, !dbg !133
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_08.c", directory: "/home/joelyang/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_08_bad", scope: !14, file: !14, line: 43, type: !15, scopeLine: 44, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_08.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 45, type: !4)
!18 = !DILocation(line: 45, column: 12, scope: !13)
!19 = !DILocalVariable(name: "dataBuffer", scope: !13, file: !14, line: 46, type: !4)
!20 = !DILocation(line: 46, column: 12, scope: !13)
!21 = !DILocation(line: 46, column: 33, scope: !13)
!22 = !DILocation(line: 47, column: 12, scope: !13)
!23 = !DILocation(line: 47, column: 10, scope: !13)
!24 = !DILocation(line: 48, column: 8, scope: !25)
!25 = distinct !DILexicalBlock(scope: !13, file: !14, line: 48, column: 8)
!26 = !DILocation(line: 48, column: 8, scope: !13)
!27 = !DILocation(line: 51, column: 16, scope: !28)
!28 = distinct !DILexicalBlock(scope: !25, file: !14, line: 49, column: 5)
!29 = !DILocation(line: 51, column: 9, scope: !28)
!30 = !DILocation(line: 52, column: 9, scope: !28)
!31 = !DILocation(line: 52, column: 21, scope: !28)
!32 = !DILocation(line: 53, column: 5, scope: !28)
!33 = !DILocalVariable(name: "dest", scope: !34, file: !14, line: 55, type: !35)
!34 = distinct !DILexicalBlock(scope: !13, file: !14, line: 54, column: 5)
!35 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 400, elements: !36)
!36 = !{!37}
!37 = !DISubrange(count: 50)
!38 = !DILocation(line: 55, column: 14, scope: !34)
!39 = !DILocation(line: 57, column: 18, scope: !34)
!40 = !DILocation(line: 57, column: 31, scope: !34)
!41 = !DILocation(line: 57, column: 24, scope: !34)
!42 = !DILocation(line: 57, column: 44, scope: !34)
!43 = !DILocation(line: 57, column: 9, scope: !34)
!44 = !DILocation(line: 58, column: 19, scope: !34)
!45 = !DILocation(line: 58, column: 9, scope: !34)
!46 = !DILocation(line: 60, column: 1, scope: !13)
!47 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_snprintf_08_good", scope: !14, file: !14, line: 111, type: !15, scopeLine: 112, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!48 = !DILocation(line: 113, column: 5, scope: !47)
!49 = !DILocation(line: 114, column: 5, scope: !47)
!50 = !DILocation(line: 115, column: 1, scope: !47)
!51 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 127, type: !52, scopeLine: 128, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!52 = !DISubroutineType(types: !53)
!53 = !{!54, !54, !55}
!54 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!55 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!56 = !DILocalVariable(name: "argc", arg: 1, scope: !51, file: !14, line: 127, type: !54)
!57 = !DILocation(line: 127, column: 14, scope: !51)
!58 = !DILocalVariable(name: "argv", arg: 2, scope: !51, file: !14, line: 127, type: !55)
!59 = !DILocation(line: 127, column: 27, scope: !51)
!60 = !DILocation(line: 130, column: 22, scope: !51)
!61 = !DILocation(line: 130, column: 12, scope: !51)
!62 = !DILocation(line: 130, column: 5, scope: !51)
!63 = !DILocation(line: 132, column: 5, scope: !51)
!64 = !DILocation(line: 133, column: 5, scope: !51)
!65 = !DILocation(line: 134, column: 5, scope: !51)
!66 = !DILocation(line: 137, column: 5, scope: !51)
!67 = !DILocation(line: 138, column: 5, scope: !51)
!68 = !DILocation(line: 139, column: 5, scope: !51)
!69 = !DILocation(line: 141, column: 5, scope: !51)
!70 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !14, file: !14, line: 31, type: !71, scopeLine: 32, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!71 = !DISubroutineType(types: !72)
!72 = !{!54}
!73 = !DILocation(line: 33, column: 5, scope: !70)
!74 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 67, type: !15, scopeLine: 68, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!75 = !DILocalVariable(name: "data", scope: !74, file: !14, line: 69, type: !4)
!76 = !DILocation(line: 69, column: 12, scope: !74)
!77 = !DILocalVariable(name: "dataBuffer", scope: !74, file: !14, line: 70, type: !4)
!78 = !DILocation(line: 70, column: 12, scope: !74)
!79 = !DILocation(line: 70, column: 33, scope: !74)
!80 = !DILocation(line: 71, column: 12, scope: !74)
!81 = !DILocation(line: 71, column: 10, scope: !74)
!82 = !DILocation(line: 72, column: 8, scope: !83)
!83 = distinct !DILexicalBlock(scope: !74, file: !14, line: 72, column: 8)
!84 = !DILocation(line: 72, column: 8, scope: !74)
!85 = !DILocation(line: 75, column: 9, scope: !86)
!86 = distinct !DILexicalBlock(scope: !83, file: !14, line: 73, column: 5)
!87 = !DILocation(line: 76, column: 5, scope: !86)
!88 = !DILocation(line: 80, column: 16, scope: !89)
!89 = distinct !DILexicalBlock(scope: !83, file: !14, line: 78, column: 5)
!90 = !DILocation(line: 80, column: 9, scope: !89)
!91 = !DILocation(line: 81, column: 9, scope: !89)
!92 = !DILocation(line: 81, column: 20, scope: !89)
!93 = !DILocalVariable(name: "dest", scope: !94, file: !14, line: 84, type: !35)
!94 = distinct !DILexicalBlock(scope: !74, file: !14, line: 83, column: 5)
!95 = !DILocation(line: 84, column: 14, scope: !94)
!96 = !DILocation(line: 86, column: 18, scope: !94)
!97 = !DILocation(line: 86, column: 31, scope: !94)
!98 = !DILocation(line: 86, column: 24, scope: !94)
!99 = !DILocation(line: 86, column: 44, scope: !94)
!100 = !DILocation(line: 86, column: 9, scope: !94)
!101 = !DILocation(line: 87, column: 19, scope: !94)
!102 = !DILocation(line: 87, column: 9, scope: !94)
!103 = !DILocation(line: 89, column: 1, scope: !74)
!104 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !14, file: !14, line: 36, type: !71, scopeLine: 37, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!105 = !DILocation(line: 38, column: 5, scope: !104)
!106 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 92, type: !15, scopeLine: 93, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!107 = !DILocalVariable(name: "data", scope: !106, file: !14, line: 94, type: !4)
!108 = !DILocation(line: 94, column: 12, scope: !106)
!109 = !DILocalVariable(name: "dataBuffer", scope: !106, file: !14, line: 95, type: !4)
!110 = !DILocation(line: 95, column: 12, scope: !106)
!111 = !DILocation(line: 95, column: 33, scope: !106)
!112 = !DILocation(line: 96, column: 12, scope: !106)
!113 = !DILocation(line: 96, column: 10, scope: !106)
!114 = !DILocation(line: 97, column: 8, scope: !115)
!115 = distinct !DILexicalBlock(scope: !106, file: !14, line: 97, column: 8)
!116 = !DILocation(line: 97, column: 8, scope: !106)
!117 = !DILocation(line: 100, column: 16, scope: !118)
!118 = distinct !DILexicalBlock(scope: !115, file: !14, line: 98, column: 5)
!119 = !DILocation(line: 100, column: 9, scope: !118)
!120 = !DILocation(line: 101, column: 9, scope: !118)
!121 = !DILocation(line: 101, column: 20, scope: !118)
!122 = !DILocation(line: 102, column: 5, scope: !118)
!123 = !DILocalVariable(name: "dest", scope: !124, file: !14, line: 104, type: !35)
!124 = distinct !DILexicalBlock(scope: !106, file: !14, line: 103, column: 5)
!125 = !DILocation(line: 104, column: 14, scope: !124)
!126 = !DILocation(line: 106, column: 18, scope: !124)
!127 = !DILocation(line: 106, column: 31, scope: !124)
!128 = !DILocation(line: 106, column: 24, scope: !124)
!129 = !DILocation(line: 106, column: 44, scope: !124)
!130 = !DILocation(line: 106, column: 9, scope: !124)
!131 = !DILocation(line: 107, column: 19, scope: !124)
!132 = !DILocation(line: 107, column: 9, scope: !124)
!133 = !DILocation(line: 109, column: 1, scope: !106)
