; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memmove_42.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memmove_42.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memmove_42_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memmove_42_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i8* null, i8** %data, align 8, !dbg !20
  %0 = load i8*, i8** %data, align 8, !dbg !21
  %call = call i8* @badSource(i8* %0), !dbg !22
  store i8* %call, i8** %data, align 8, !dbg !23
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !24, metadata !DIExpression()), !dbg !29
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !29
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memmove_42_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !29
  %2 = load i8*, i8** %data, align 8, !dbg !30
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !31
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !32
  %call2 = call i64 @strlen(i8* %arraydecay1) #7, !dbg !33
  %add = add i64 %call2, 1, !dbg !34
  %mul = mul i64 %add, 1, !dbg !35
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 1 %2, i8* align 1 %arraydecay, i64 %mul, i1 false), !dbg !31
  %3 = load i8*, i8** %data, align 8, !dbg !36
  call void @printLine(i8* %3), !dbg !37
  %4 = load i8*, i8** %data, align 8, !dbg !38
  call void @free(i8* %4) #8, !dbg !39
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
  %call = call noalias align 16 i8* @malloc(i64 10) #8, !dbg !46
  store i8* %call, i8** %data.addr, align 8, !dbg !47
  %0 = load i8*, i8** %data.addr, align 8, !dbg !48
  %cmp = icmp eq i8* %0, null, !dbg !50
  br i1 %cmp, label %if.then, label %if.end, !dbg !51

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #9, !dbg !52
  unreachable, !dbg !52

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data.addr, align 8, !dbg !54
  ret i8* %1, !dbg !55
}

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memmove_42_good() #0 !dbg !56 {
entry:
  call void @goodG2B(), !dbg !57
  ret void, !dbg !58
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !59 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !64, metadata !DIExpression()), !dbg !65
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !66, metadata !DIExpression()), !dbg !67
  %call = call i64 @time(i64* null) #8, !dbg !68
  %conv = trunc i64 %call to i32, !dbg !69
  call void @srand(i32 %conv) #8, !dbg !70
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !71
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memmove_42_good(), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !74
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memmove_42_bad(), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !76
  ret i32 0, !dbg !77
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #5

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !78 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !79, metadata !DIExpression()), !dbg !80
  store i8* null, i8** %data, align 8, !dbg !81
  %0 = load i8*, i8** %data, align 8, !dbg !82
  %call = call i8* @goodG2BSource(i8* %0), !dbg !83
  store i8* %call, i8** %data, align 8, !dbg !84
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !85, metadata !DIExpression()), !dbg !87
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !87
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B.source, i32 0, i32 0), i64 11, i1 false), !dbg !87
  %2 = load i8*, i8** %data, align 8, !dbg !88
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !89
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !90
  %call2 = call i64 @strlen(i8* %arraydecay1) #7, !dbg !91
  %add = add i64 %call2, 1, !dbg !92
  %mul = mul i64 %add, 1, !dbg !93
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 1 %2, i8* align 1 %arraydecay, i64 %mul, i1 false), !dbg !89
  %3 = load i8*, i8** %data, align 8, !dbg !94
  call void @printLine(i8* %3), !dbg !95
  %4 = load i8*, i8** %data, align 8, !dbg !96
  call void @free(i8* %4) #8, !dbg !97
  ret void, !dbg !98
}

; Function Attrs: noinline nounwind uwtable
define internal i8* @goodG2BSource(i8* %data) #0 !dbg !99 {
entry:
  %data.addr = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !100, metadata !DIExpression()), !dbg !101
  %call = call noalias align 16 i8* @malloc(i64 11) #8, !dbg !102
  store i8* %call, i8** %data.addr, align 8, !dbg !103
  %0 = load i8*, i8** %data.addr, align 8, !dbg !104
  %cmp = icmp eq i8* %0, null, !dbg !106
  br i1 %cmp, label %if.then, label %if.end, !dbg !107

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #9, !dbg !108
  unreachable, !dbg !108

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data.addr, align 8, !dbg !110
  ret i8* %1, !dbg !111
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind readonly willreturn }
attributes #8 = { nounwind }
attributes #9 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memmove_42.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !5, !7}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!8 = !{i32 7, !"Dwarf Version", i32 4}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{i32 1, !"wchar_size", i32 4}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"clang version 13.0.0"}
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memmove_42_bad", scope: !15, file: !15, line: 36, type: !16, scopeLine: 37, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memmove_42.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 38, type: !5)
!19 = !DILocation(line: 38, column: 12, scope: !14)
!20 = !DILocation(line: 39, column: 10, scope: !14)
!21 = !DILocation(line: 40, column: 22, scope: !14)
!22 = !DILocation(line: 40, column: 12, scope: !14)
!23 = !DILocation(line: 40, column: 10, scope: !14)
!24 = !DILocalVariable(name: "source", scope: !25, file: !15, line: 42, type: !26)
!25 = distinct !DILexicalBlock(scope: !14, file: !15, line: 41, column: 5)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 88, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 11)
!29 = !DILocation(line: 42, column: 14, scope: !25)
!30 = !DILocation(line: 45, column: 17, scope: !25)
!31 = !DILocation(line: 45, column: 9, scope: !25)
!32 = !DILocation(line: 45, column: 39, scope: !25)
!33 = !DILocation(line: 45, column: 32, scope: !25)
!34 = !DILocation(line: 45, column: 47, scope: !25)
!35 = !DILocation(line: 45, column: 52, scope: !25)
!36 = !DILocation(line: 46, column: 19, scope: !25)
!37 = !DILocation(line: 46, column: 9, scope: !25)
!38 = !DILocation(line: 47, column: 14, scope: !25)
!39 = !DILocation(line: 47, column: 9, scope: !25)
!40 = !DILocation(line: 49, column: 1, scope: !14)
!41 = distinct !DISubprogram(name: "badSource", scope: !15, file: !15, line: 28, type: !42, scopeLine: 29, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!42 = !DISubroutineType(types: !43)
!43 = !{!5, !5}
!44 = !DILocalVariable(name: "data", arg: 1, scope: !41, file: !15, line: 28, type: !5)
!45 = !DILocation(line: 28, column: 32, scope: !41)
!46 = !DILocation(line: 31, column: 20, scope: !41)
!47 = !DILocation(line: 31, column: 10, scope: !41)
!48 = !DILocation(line: 32, column: 9, scope: !49)
!49 = distinct !DILexicalBlock(scope: !41, file: !15, line: 32, column: 9)
!50 = !DILocation(line: 32, column: 14, scope: !49)
!51 = !DILocation(line: 32, column: 9, scope: !41)
!52 = !DILocation(line: 32, column: 24, scope: !53)
!53 = distinct !DILexicalBlock(scope: !49, file: !15, line: 32, column: 23)
!54 = !DILocation(line: 33, column: 12, scope: !41)
!55 = !DILocation(line: 33, column: 5, scope: !41)
!56 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memmove_42_good", scope: !15, file: !15, line: 79, type: !16, scopeLine: 80, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!57 = !DILocation(line: 81, column: 5, scope: !56)
!58 = !DILocation(line: 82, column: 1, scope: !56)
!59 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 94, type: !60, scopeLine: 95, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!60 = !DISubroutineType(types: !61)
!61 = !{!62, !62, !63}
!62 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!64 = !DILocalVariable(name: "argc", arg: 1, scope: !59, file: !15, line: 94, type: !62)
!65 = !DILocation(line: 94, column: 14, scope: !59)
!66 = !DILocalVariable(name: "argv", arg: 2, scope: !59, file: !15, line: 94, type: !63)
!67 = !DILocation(line: 94, column: 27, scope: !59)
!68 = !DILocation(line: 97, column: 22, scope: !59)
!69 = !DILocation(line: 97, column: 12, scope: !59)
!70 = !DILocation(line: 97, column: 5, scope: !59)
!71 = !DILocation(line: 99, column: 5, scope: !59)
!72 = !DILocation(line: 100, column: 5, scope: !59)
!73 = !DILocation(line: 101, column: 5, scope: !59)
!74 = !DILocation(line: 104, column: 5, scope: !59)
!75 = !DILocation(line: 105, column: 5, scope: !59)
!76 = !DILocation(line: 106, column: 5, scope: !59)
!77 = !DILocation(line: 108, column: 5, scope: !59)
!78 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 64, type: !16, scopeLine: 65, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!79 = !DILocalVariable(name: "data", scope: !78, file: !15, line: 66, type: !5)
!80 = !DILocation(line: 66, column: 12, scope: !78)
!81 = !DILocation(line: 67, column: 10, scope: !78)
!82 = !DILocation(line: 68, column: 26, scope: !78)
!83 = !DILocation(line: 68, column: 12, scope: !78)
!84 = !DILocation(line: 68, column: 10, scope: !78)
!85 = !DILocalVariable(name: "source", scope: !86, file: !15, line: 70, type: !26)
!86 = distinct !DILexicalBlock(scope: !78, file: !15, line: 69, column: 5)
!87 = !DILocation(line: 70, column: 14, scope: !86)
!88 = !DILocation(line: 73, column: 17, scope: !86)
!89 = !DILocation(line: 73, column: 9, scope: !86)
!90 = !DILocation(line: 73, column: 39, scope: !86)
!91 = !DILocation(line: 73, column: 32, scope: !86)
!92 = !DILocation(line: 73, column: 47, scope: !86)
!93 = !DILocation(line: 73, column: 52, scope: !86)
!94 = !DILocation(line: 74, column: 19, scope: !86)
!95 = !DILocation(line: 74, column: 9, scope: !86)
!96 = !DILocation(line: 75, column: 14, scope: !86)
!97 = !DILocation(line: 75, column: 9, scope: !86)
!98 = !DILocation(line: 77, column: 1, scope: !78)
!99 = distinct !DISubprogram(name: "goodG2BSource", scope: !15, file: !15, line: 55, type: !42, scopeLine: 56, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!100 = !DILocalVariable(name: "data", arg: 1, scope: !99, file: !15, line: 55, type: !5)
!101 = !DILocation(line: 55, column: 36, scope: !99)
!102 = !DILocation(line: 58, column: 20, scope: !99)
!103 = !DILocation(line: 58, column: 10, scope: !99)
!104 = !DILocation(line: 59, column: 9, scope: !105)
!105 = distinct !DILexicalBlock(scope: !99, file: !15, line: 59, column: 9)
!106 = !DILocation(line: 59, column: 14, scope: !105)
!107 = !DILocation(line: 59, column: 9, scope: !99)
!108 = !DILocation(line: 59, column: 24, scope: !109)
!109 = distinct !DILexicalBlock(scope: !105, file: !15, line: 59, column: 23)
!110 = !DILocation(line: 60, column: 12, scope: !99)
!111 = !DILocation(line: 60, column: 5, scope: !99)
