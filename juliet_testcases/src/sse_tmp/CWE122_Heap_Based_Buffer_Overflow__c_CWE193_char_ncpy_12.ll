; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_12.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_12.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_12_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_12_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i8* null, i8** %data, align 8, !dbg !20
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !21
  %tobool = icmp ne i32 %call, 0, !dbg !21
  br i1 %tobool, label %if.then, label %if.else, !dbg !23

if.then:                                          ; preds = %entry
  %call1 = call noalias align 16 i8* @malloc(i64 10) #7, !dbg !24
  store i8* %call1, i8** %data, align 8, !dbg !26
  %0 = load i8*, i8** %data, align 8, !dbg !27
  %cmp = icmp eq i8* %0, null, !dbg !29
  br i1 %cmp, label %if.then2, label %if.end, !dbg !30

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !31
  unreachable, !dbg !31

if.end:                                           ; preds = %if.then
  br label %if.end7, !dbg !33

if.else:                                          ; preds = %entry
  %call3 = call noalias align 16 i8* @malloc(i64 11) #7, !dbg !34
  store i8* %call3, i8** %data, align 8, !dbg !36
  %1 = load i8*, i8** %data, align 8, !dbg !37
  %cmp4 = icmp eq i8* %1, null, !dbg !39
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !40

if.then5:                                         ; preds = %if.else
  call void @exit(i32 -1) #8, !dbg !41
  unreachable, !dbg !41

if.end6:                                          ; preds = %if.else
  br label %if.end7

if.end7:                                          ; preds = %if.end6, %if.end
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !43, metadata !DIExpression()), !dbg !48
  %2 = bitcast [11 x i8]* %source to i8*, !dbg !48
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %2, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_12_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !48
  %3 = load i8*, i8** %data, align 8, !dbg !49
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !50
  %arraydecay8 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !51
  %call9 = call i64 @strlen(i8* %arraydecay8) #9, !dbg !52
  %add = add i64 %call9, 1, !dbg !53
  %call10 = call i8* @strncpy(i8* %3, i8* %arraydecay, i64 %add) #7, !dbg !54
  %4 = load i8*, i8** %data, align 8, !dbg !55
  call void @printLine(i8* %4), !dbg !56
  %5 = load i8*, i8** %data, align 8, !dbg !57
  call void @free(i8* %5) #7, !dbg !58
  ret void, !dbg !59
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @globalReturnsTrueOrFalse(...) #2

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #3

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #4

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #5

; Function Attrs: nounwind
declare dso_local i8* @strncpy(i8*, i8*, i64) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #6

declare dso_local void @printLine(i8*) #2

; Function Attrs: nounwind
declare dso_local void @free(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_12_good() #0 !dbg !60 {
entry:
  call void @goodG2B(), !dbg !61
  ret void, !dbg !62
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !63 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !68, metadata !DIExpression()), !dbg !69
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !70, metadata !DIExpression()), !dbg !71
  %call = call i64 @time(i64* null) #7, !dbg !72
  %conv = trunc i64 %call to i32, !dbg !73
  call void @srand(i32 %conv) #7, !dbg !74
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !75
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_12_good(), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !78
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_12_bad(), !dbg !79
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !80
  ret i32 0, !dbg !81
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !82 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !83, metadata !DIExpression()), !dbg !84
  store i8* null, i8** %data, align 8, !dbg !85
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !86
  %tobool = icmp ne i32 %call, 0, !dbg !86
  br i1 %tobool, label %if.then, label %if.else, !dbg !88

if.then:                                          ; preds = %entry
  %call1 = call noalias align 16 i8* @malloc(i64 11) #7, !dbg !89
  store i8* %call1, i8** %data, align 8, !dbg !91
  %0 = load i8*, i8** %data, align 8, !dbg !92
  %cmp = icmp eq i8* %0, null, !dbg !94
  br i1 %cmp, label %if.then2, label %if.end, !dbg !95

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !96
  unreachable, !dbg !96

if.end:                                           ; preds = %if.then
  br label %if.end7, !dbg !98

if.else:                                          ; preds = %entry
  %call3 = call noalias align 16 i8* @malloc(i64 11) #7, !dbg !99
  store i8* %call3, i8** %data, align 8, !dbg !101
  %1 = load i8*, i8** %data, align 8, !dbg !102
  %cmp4 = icmp eq i8* %1, null, !dbg !104
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !105

if.then5:                                         ; preds = %if.else
  call void @exit(i32 -1) #8, !dbg !106
  unreachable, !dbg !106

if.end6:                                          ; preds = %if.else
  br label %if.end7

if.end7:                                          ; preds = %if.end6, %if.end
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !108, metadata !DIExpression()), !dbg !110
  %2 = bitcast [11 x i8]* %source to i8*, !dbg !110
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %2, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B.source, i32 0, i32 0), i64 11, i1 false), !dbg !110
  %3 = load i8*, i8** %data, align 8, !dbg !111
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !112
  %arraydecay8 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !113
  %call9 = call i64 @strlen(i8* %arraydecay8) #9, !dbg !114
  %add = add i64 %call9, 1, !dbg !115
  %call10 = call i8* @strncpy(i8* %3, i8* %arraydecay, i64 %add) #7, !dbg !116
  %4 = load i8*, i8** %data, align 8, !dbg !117
  call void @printLine(i8* %4), !dbg !118
  %5 = load i8*, i8** %data, align 8, !dbg !119
  call void @free(i8* %5) #7, !dbg !120
  ret void, !dbg !121
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly nofree nounwind willreturn }
attributes #6 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }
attributes #9 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_12.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6, !7}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{i32 7, !"Dwarf Version", i32 4}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{i32 1, !"wchar_size", i32 4}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"clang version 13.0.0"}
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_12_bad", scope: !15, file: !15, line: 28, type: !16, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_12.c", directory: "/root/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 30, type: !4)
!19 = !DILocation(line: 30, column: 12, scope: !14)
!20 = !DILocation(line: 31, column: 10, scope: !14)
!21 = !DILocation(line: 32, column: 8, scope: !22)
!22 = distinct !DILexicalBlock(scope: !14, file: !15, line: 32, column: 8)
!23 = !DILocation(line: 32, column: 8, scope: !14)
!24 = !DILocation(line: 35, column: 24, scope: !25)
!25 = distinct !DILexicalBlock(scope: !22, file: !15, line: 33, column: 5)
!26 = !DILocation(line: 35, column: 14, scope: !25)
!27 = !DILocation(line: 36, column: 13, scope: !28)
!28 = distinct !DILexicalBlock(scope: !25, file: !15, line: 36, column: 13)
!29 = !DILocation(line: 36, column: 18, scope: !28)
!30 = !DILocation(line: 36, column: 13, scope: !25)
!31 = !DILocation(line: 36, column: 28, scope: !32)
!32 = distinct !DILexicalBlock(scope: !28, file: !15, line: 36, column: 27)
!33 = !DILocation(line: 37, column: 5, scope: !25)
!34 = !DILocation(line: 41, column: 24, scope: !35)
!35 = distinct !DILexicalBlock(scope: !22, file: !15, line: 39, column: 5)
!36 = !DILocation(line: 41, column: 14, scope: !35)
!37 = !DILocation(line: 42, column: 13, scope: !38)
!38 = distinct !DILexicalBlock(scope: !35, file: !15, line: 42, column: 13)
!39 = !DILocation(line: 42, column: 18, scope: !38)
!40 = !DILocation(line: 42, column: 13, scope: !35)
!41 = !DILocation(line: 42, column: 28, scope: !42)
!42 = distinct !DILexicalBlock(scope: !38, file: !15, line: 42, column: 27)
!43 = !DILocalVariable(name: "source", scope: !44, file: !15, line: 45, type: !45)
!44 = distinct !DILexicalBlock(scope: !14, file: !15, line: 44, column: 5)
!45 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 88, elements: !46)
!46 = !{!47}
!47 = !DISubrange(count: 11)
!48 = !DILocation(line: 45, column: 14, scope: !44)
!49 = !DILocation(line: 48, column: 17, scope: !44)
!50 = !DILocation(line: 48, column: 23, scope: !44)
!51 = !DILocation(line: 48, column: 38, scope: !44)
!52 = !DILocation(line: 48, column: 31, scope: !44)
!53 = !DILocation(line: 48, column: 46, scope: !44)
!54 = !DILocation(line: 48, column: 9, scope: !44)
!55 = !DILocation(line: 49, column: 19, scope: !44)
!56 = !DILocation(line: 49, column: 9, scope: !44)
!57 = !DILocation(line: 50, column: 14, scope: !44)
!58 = !DILocation(line: 50, column: 9, scope: !44)
!59 = !DILocation(line: 52, column: 1, scope: !14)
!60 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_12_good", scope: !15, file: !15, line: 86, type: !16, scopeLine: 87, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!61 = !DILocation(line: 88, column: 5, scope: !60)
!62 = !DILocation(line: 89, column: 1, scope: !60)
!63 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 101, type: !64, scopeLine: 102, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!64 = !DISubroutineType(types: !65)
!65 = !{!66, !66, !67}
!66 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!67 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!68 = !DILocalVariable(name: "argc", arg: 1, scope: !63, file: !15, line: 101, type: !66)
!69 = !DILocation(line: 101, column: 14, scope: !63)
!70 = !DILocalVariable(name: "argv", arg: 2, scope: !63, file: !15, line: 101, type: !67)
!71 = !DILocation(line: 101, column: 27, scope: !63)
!72 = !DILocation(line: 104, column: 22, scope: !63)
!73 = !DILocation(line: 104, column: 12, scope: !63)
!74 = !DILocation(line: 104, column: 5, scope: !63)
!75 = !DILocation(line: 106, column: 5, scope: !63)
!76 = !DILocation(line: 107, column: 5, scope: !63)
!77 = !DILocation(line: 108, column: 5, scope: !63)
!78 = !DILocation(line: 111, column: 5, scope: !63)
!79 = !DILocation(line: 112, column: 5, scope: !63)
!80 = !DILocation(line: 113, column: 5, scope: !63)
!81 = !DILocation(line: 115, column: 5, scope: !63)
!82 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 60, type: !16, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!83 = !DILocalVariable(name: "data", scope: !82, file: !15, line: 62, type: !4)
!84 = !DILocation(line: 62, column: 12, scope: !82)
!85 = !DILocation(line: 63, column: 10, scope: !82)
!86 = !DILocation(line: 64, column: 8, scope: !87)
!87 = distinct !DILexicalBlock(scope: !82, file: !15, line: 64, column: 8)
!88 = !DILocation(line: 64, column: 8, scope: !82)
!89 = !DILocation(line: 67, column: 24, scope: !90)
!90 = distinct !DILexicalBlock(scope: !87, file: !15, line: 65, column: 5)
!91 = !DILocation(line: 67, column: 14, scope: !90)
!92 = !DILocation(line: 68, column: 13, scope: !93)
!93 = distinct !DILexicalBlock(scope: !90, file: !15, line: 68, column: 13)
!94 = !DILocation(line: 68, column: 18, scope: !93)
!95 = !DILocation(line: 68, column: 13, scope: !90)
!96 = !DILocation(line: 68, column: 28, scope: !97)
!97 = distinct !DILexicalBlock(scope: !93, file: !15, line: 68, column: 27)
!98 = !DILocation(line: 69, column: 5, scope: !90)
!99 = !DILocation(line: 73, column: 24, scope: !100)
!100 = distinct !DILexicalBlock(scope: !87, file: !15, line: 71, column: 5)
!101 = !DILocation(line: 73, column: 14, scope: !100)
!102 = !DILocation(line: 74, column: 13, scope: !103)
!103 = distinct !DILexicalBlock(scope: !100, file: !15, line: 74, column: 13)
!104 = !DILocation(line: 74, column: 18, scope: !103)
!105 = !DILocation(line: 74, column: 13, scope: !100)
!106 = !DILocation(line: 74, column: 28, scope: !107)
!107 = distinct !DILexicalBlock(scope: !103, file: !15, line: 74, column: 27)
!108 = !DILocalVariable(name: "source", scope: !109, file: !15, line: 77, type: !45)
!109 = distinct !DILexicalBlock(scope: !82, file: !15, line: 76, column: 5)
!110 = !DILocation(line: 77, column: 14, scope: !109)
!111 = !DILocation(line: 80, column: 17, scope: !109)
!112 = !DILocation(line: 80, column: 23, scope: !109)
!113 = !DILocation(line: 80, column: 38, scope: !109)
!114 = !DILocation(line: 80, column: 31, scope: !109)
!115 = !DILocation(line: 80, column: 46, scope: !109)
!116 = !DILocation(line: 80, column: 9, scope: !109)
!117 = !DILocation(line: 81, column: 19, scope: !109)
!118 = !DILocation(line: 81, column: 9, scope: !109)
!119 = !DILocation(line: 82, column: 14, scope: !109)
!120 = !DILocation(line: 82, column: 9, scope: !109)
!121 = !DILocation(line: 84, column: 1, scope: !82)
