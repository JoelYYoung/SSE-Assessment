; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_44.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_44.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_44_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %funcPtr = alloca void (i8*)*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata void (i8*)** %funcPtr, metadata !20, metadata !DIExpression()), !dbg !24
  store void (i8*)* @badSink, void (i8*)** %funcPtr, align 8, !dbg !24
  store i8* null, i8** %data, align 8, !dbg !25
  %call = call noalias align 16 i8* @malloc(i64 50) #6, !dbg !26
  store i8* %call, i8** %data, align 8, !dbg !27
  %0 = load i8*, i8** %data, align 8, !dbg !28
  %cmp = icmp eq i8* %0, null, !dbg !30
  br i1 %cmp, label %if.then, label %if.end, !dbg !31

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !32
  unreachable, !dbg !32

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !34
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !34
  store i8 0, i8* %arrayidx, align 1, !dbg !35
  %2 = load void (i8*)*, void (i8*)** %funcPtr, align 8, !dbg !36
  %3 = load i8*, i8** %data, align 8, !dbg !37
  call void %2(i8* %3), !dbg !36
  ret void, !dbg !38
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal void @badSink(i8* %data) #0 !dbg !39 {
entry:
  %data.addr = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !40, metadata !DIExpression()), !dbg !41
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !42, metadata !DIExpression()), !dbg !47
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !48
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !48
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !49
  store i8 0, i8* %arrayidx, align 1, !dbg !50
  %0 = load i8*, i8** %data.addr, align 8, !dbg !51
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !52
  %call = call i8* @strncpy(i8* %0, i8* %arraydecay1, i64 99) #6, !dbg !53
  %1 = load i8*, i8** %data.addr, align 8, !dbg !54
  %arrayidx2 = getelementptr inbounds i8, i8* %1, i64 99, !dbg !54
  store i8 0, i8* %arrayidx2, align 1, !dbg !55
  %2 = load i8*, i8** %data.addr, align 8, !dbg !56
  call void @printLine(i8* %2), !dbg !57
  %3 = load i8*, i8** %data.addr, align 8, !dbg !58
  call void @free(i8* %3) #6, !dbg !59
  ret void, !dbg !60
}

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_44_good() #0 !dbg !61 {
entry:
  call void @goodG2B(), !dbg !62
  ret void, !dbg !63
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !64 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !69, metadata !DIExpression()), !dbg !70
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !71, metadata !DIExpression()), !dbg !72
  %call = call i64 @time(i64* null) #6, !dbg !73
  %conv = trunc i64 %call to i32, !dbg !74
  call void @srand(i32 %conv) #6, !dbg !75
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !76
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_44_good(), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !79
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_44_bad(), !dbg !80
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !81
  ret i32 0, !dbg !82
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #5

; Function Attrs: nounwind
declare dso_local i8* @strncpy(i8*, i8*, i64) #2

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !83 {
entry:
  %data = alloca i8*, align 8
  %funcPtr = alloca void (i8*)*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !84, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.declare(metadata void (i8*)** %funcPtr, metadata !86, metadata !DIExpression()), !dbg !87
  store void (i8*)* @goodG2BSink, void (i8*)** %funcPtr, align 8, !dbg !87
  store i8* null, i8** %data, align 8, !dbg !88
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !89
  store i8* %call, i8** %data, align 8, !dbg !90
  %0 = load i8*, i8** %data, align 8, !dbg !91
  %cmp = icmp eq i8* %0, null, !dbg !93
  br i1 %cmp, label %if.then, label %if.end, !dbg !94

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !95
  unreachable, !dbg !95

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !97
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !97
  store i8 0, i8* %arrayidx, align 1, !dbg !98
  %2 = load void (i8*)*, void (i8*)** %funcPtr, align 8, !dbg !99
  %3 = load i8*, i8** %data, align 8, !dbg !100
  call void %2(i8* %3), !dbg !99
  ret void, !dbg !101
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink(i8* %data) #0 !dbg !102 {
entry:
  %data.addr = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !103, metadata !DIExpression()), !dbg !104
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !105, metadata !DIExpression()), !dbg !107
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !108
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !108
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !109
  store i8 0, i8* %arrayidx, align 1, !dbg !110
  %0 = load i8*, i8** %data.addr, align 8, !dbg !111
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !112
  %call = call i8* @strncpy(i8* %0, i8* %arraydecay1, i64 99) #6, !dbg !113
  %1 = load i8*, i8** %data.addr, align 8, !dbg !114
  %arrayidx2 = getelementptr inbounds i8, i8* %1, i64 99, !dbg !114
  store i8 0, i8* %arrayidx2, align 1, !dbg !115
  %2 = load i8*, i8** %data.addr, align 8, !dbg !116
  call void @printLine(i8* %2), !dbg !117
  %3 = load i8*, i8** %data.addr, align 8, !dbg !118
  call void @free(i8* %3) #6, !dbg !119
  ret void, !dbg !120
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly nofree nounwind willreturn writeonly }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_44.c", directory: "/root/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_44_bad", scope: !15, file: !15, line: 37, type: !16, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_44.c", directory: "/root/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 39, type: !4)
!19 = !DILocation(line: 39, column: 12, scope: !14)
!20 = !DILocalVariable(name: "funcPtr", scope: !14, file: !15, line: 41, type: !21)
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !22, size: 64)
!22 = !DISubroutineType(types: !23)
!23 = !{null, !4}
!24 = !DILocation(line: 41, column: 12, scope: !14)
!25 = !DILocation(line: 42, column: 10, scope: !14)
!26 = !DILocation(line: 44, column: 20, scope: !14)
!27 = !DILocation(line: 44, column: 10, scope: !14)
!28 = !DILocation(line: 45, column: 9, scope: !29)
!29 = distinct !DILexicalBlock(scope: !14, file: !15, line: 45, column: 9)
!30 = !DILocation(line: 45, column: 14, scope: !29)
!31 = !DILocation(line: 45, column: 9, scope: !14)
!32 = !DILocation(line: 45, column: 24, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !15, line: 45, column: 23)
!34 = !DILocation(line: 46, column: 5, scope: !14)
!35 = !DILocation(line: 46, column: 13, scope: !14)
!36 = !DILocation(line: 48, column: 5, scope: !14)
!37 = !DILocation(line: 48, column: 13, scope: !14)
!38 = !DILocation(line: 49, column: 1, scope: !14)
!39 = distinct !DISubprogram(name: "badSink", scope: !15, file: !15, line: 23, type: !22, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!40 = !DILocalVariable(name: "data", arg: 1, scope: !39, file: !15, line: 23, type: !4)
!41 = !DILocation(line: 23, column: 28, scope: !39)
!42 = !DILocalVariable(name: "source", scope: !43, file: !15, line: 26, type: !44)
!43 = distinct !DILexicalBlock(scope: !39, file: !15, line: 25, column: 5)
!44 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !45)
!45 = !{!46}
!46 = !DISubrange(count: 100)
!47 = !DILocation(line: 26, column: 14, scope: !43)
!48 = !DILocation(line: 27, column: 9, scope: !43)
!49 = !DILocation(line: 28, column: 9, scope: !43)
!50 = !DILocation(line: 28, column: 23, scope: !43)
!51 = !DILocation(line: 30, column: 17, scope: !43)
!52 = !DILocation(line: 30, column: 23, scope: !43)
!53 = !DILocation(line: 30, column: 9, scope: !43)
!54 = !DILocation(line: 31, column: 9, scope: !43)
!55 = !DILocation(line: 31, column: 21, scope: !43)
!56 = !DILocation(line: 32, column: 19, scope: !43)
!57 = !DILocation(line: 32, column: 9, scope: !43)
!58 = !DILocation(line: 33, column: 14, scope: !43)
!59 = !DILocation(line: 33, column: 9, scope: !43)
!60 = !DILocation(line: 35, column: 1, scope: !39)
!61 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_44_good", scope: !15, file: !15, line: 82, type: !16, scopeLine: 83, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!62 = !DILocation(line: 84, column: 5, scope: !61)
!63 = !DILocation(line: 85, column: 1, scope: !61)
!64 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 96, type: !65, scopeLine: 97, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!65 = !DISubroutineType(types: !66)
!66 = !{!67, !67, !68}
!67 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!68 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!69 = !DILocalVariable(name: "argc", arg: 1, scope: !64, file: !15, line: 96, type: !67)
!70 = !DILocation(line: 96, column: 14, scope: !64)
!71 = !DILocalVariable(name: "argv", arg: 2, scope: !64, file: !15, line: 96, type: !68)
!72 = !DILocation(line: 96, column: 27, scope: !64)
!73 = !DILocation(line: 99, column: 22, scope: !64)
!74 = !DILocation(line: 99, column: 12, scope: !64)
!75 = !DILocation(line: 99, column: 5, scope: !64)
!76 = !DILocation(line: 101, column: 5, scope: !64)
!77 = !DILocation(line: 102, column: 5, scope: !64)
!78 = !DILocation(line: 103, column: 5, scope: !64)
!79 = !DILocation(line: 106, column: 5, scope: !64)
!80 = !DILocation(line: 107, column: 5, scope: !64)
!81 = !DILocation(line: 108, column: 5, scope: !64)
!82 = !DILocation(line: 110, column: 5, scope: !64)
!83 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 70, type: !16, scopeLine: 71, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!84 = !DILocalVariable(name: "data", scope: !83, file: !15, line: 72, type: !4)
!85 = !DILocation(line: 72, column: 12, scope: !83)
!86 = !DILocalVariable(name: "funcPtr", scope: !83, file: !15, line: 73, type: !21)
!87 = !DILocation(line: 73, column: 12, scope: !83)
!88 = !DILocation(line: 74, column: 10, scope: !83)
!89 = !DILocation(line: 76, column: 20, scope: !83)
!90 = !DILocation(line: 76, column: 10, scope: !83)
!91 = !DILocation(line: 77, column: 9, scope: !92)
!92 = distinct !DILexicalBlock(scope: !83, file: !15, line: 77, column: 9)
!93 = !DILocation(line: 77, column: 14, scope: !92)
!94 = !DILocation(line: 77, column: 9, scope: !83)
!95 = !DILocation(line: 77, column: 24, scope: !96)
!96 = distinct !DILexicalBlock(scope: !92, file: !15, line: 77, column: 23)
!97 = !DILocation(line: 78, column: 5, scope: !83)
!98 = !DILocation(line: 78, column: 13, scope: !83)
!99 = !DILocation(line: 79, column: 5, scope: !83)
!100 = !DILocation(line: 79, column: 13, scope: !83)
!101 = !DILocation(line: 80, column: 1, scope: !83)
!102 = distinct !DISubprogram(name: "goodG2BSink", scope: !15, file: !15, line: 56, type: !22, scopeLine: 57, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!103 = !DILocalVariable(name: "data", arg: 1, scope: !102, file: !15, line: 56, type: !4)
!104 = !DILocation(line: 56, column: 32, scope: !102)
!105 = !DILocalVariable(name: "source", scope: !106, file: !15, line: 59, type: !44)
!106 = distinct !DILexicalBlock(scope: !102, file: !15, line: 58, column: 5)
!107 = !DILocation(line: 59, column: 14, scope: !106)
!108 = !DILocation(line: 60, column: 9, scope: !106)
!109 = !DILocation(line: 61, column: 9, scope: !106)
!110 = !DILocation(line: 61, column: 23, scope: !106)
!111 = !DILocation(line: 63, column: 17, scope: !106)
!112 = !DILocation(line: 63, column: 23, scope: !106)
!113 = !DILocation(line: 63, column: 9, scope: !106)
!114 = !DILocation(line: 64, column: 9, scope: !106)
!115 = !DILocation(line: 64, column: 21, scope: !106)
!116 = !DILocation(line: 65, column: 19, scope: !106)
!117 = !DILocation(line: 65, column: 9, scope: !106)
!118 = !DILocation(line: 66, column: 14, scope: !106)
!119 = !DILocation(line: 66, column: 9, scope: !106)
!120 = !DILocation(line: 68, column: 1, scope: !102)
