; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_45.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_45.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_45_badData = internal global i8* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.badSink.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_45_goodG2BData = internal global i8* null, align 8, !dbg !11
@__const.goodG2BSink.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_45_bad() #0 !dbg !20 {
entry:
  %data = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !23, metadata !DIExpression()), !dbg !24
  store i8* null, i8** %data, align 8, !dbg !25
  %call = call noalias align 16 i8* @malloc(i64 10) #7, !dbg !26
  store i8* %call, i8** %data, align 8, !dbg !27
  %0 = load i8*, i8** %data, align 8, !dbg !28
  %cmp = icmp eq i8* %0, null, !dbg !30
  br i1 %cmp, label %if.then, label %if.end, !dbg !31

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !32
  unreachable, !dbg !32

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !34
  store i8* %1, i8** @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_45_badData, align 8, !dbg !35
  call void @badSink(), !dbg !36
  ret void, !dbg !37
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_45_good() #0 !dbg !38 {
entry:
  call void @goodG2B(), !dbg !39
  ret void, !dbg !40
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !41 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !46, metadata !DIExpression()), !dbg !47
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !48, metadata !DIExpression()), !dbg !49
  %call = call i64 @time(i64* null) #7, !dbg !50
  %conv = trunc i64 %call to i32, !dbg !51
  call void @srand(i32 %conv) #7, !dbg !52
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !53
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_45_good(), !dbg !54
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !55
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !56
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_45_bad(), !dbg !57
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !58
  ret i32 0, !dbg !59
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @badSink() #0 !dbg !60 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !61, metadata !DIExpression()), !dbg !62
  %0 = load i8*, i8** @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_45_badData, align 8, !dbg !63
  store i8* %0, i8** %data, align 8, !dbg !62
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !64, metadata !DIExpression()), !dbg !69
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !69
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.badSink.source, i32 0, i32 0), i64 11, i1 false), !dbg !69
  %2 = load i8*, i8** %data, align 8, !dbg !70
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !71
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !72
  %call = call i64 @strlen(i8* %arraydecay1) #9, !dbg !73
  %add = add i64 %call, 1, !dbg !74
  %mul = mul i64 %add, 1, !dbg !75
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %2, i8* align 1 %arraydecay, i64 %mul, i1 false), !dbg !71
  %3 = load i8*, i8** %data, align 8, !dbg !76
  call void @printLine(i8* %3), !dbg !77
  %4 = load i8*, i8** %data, align 8, !dbg !78
  call void @free(i8* %4) #7, !dbg !79
  ret void, !dbg !80
}

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #5

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #6

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !81 {
entry:
  %data = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !82, metadata !DIExpression()), !dbg !83
  store i8* null, i8** %data, align 8, !dbg !84
  %call = call noalias align 16 i8* @malloc(i64 11) #7, !dbg !85
  store i8* %call, i8** %data, align 8, !dbg !86
  %0 = load i8*, i8** %data, align 8, !dbg !87
  %cmp = icmp eq i8* %0, null, !dbg !89
  br i1 %cmp, label %if.then, label %if.end, !dbg !90

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !91
  unreachable, !dbg !91

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !93
  store i8* %1, i8** @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_45_goodG2BData, align 8, !dbg !94
  call void @goodG2BSink(), !dbg !95
  ret void, !dbg !96
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink() #0 !dbg !97 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !98, metadata !DIExpression()), !dbg !99
  %0 = load i8*, i8** @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_45_goodG2BData, align 8, !dbg !100
  store i8* %0, i8** %data, align 8, !dbg !99
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !101, metadata !DIExpression()), !dbg !103
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !103
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2BSink.source, i32 0, i32 0), i64 11, i1 false), !dbg !103
  %2 = load i8*, i8** %data, align 8, !dbg !104
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !105
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !106
  %call = call i64 @strlen(i8* %arraydecay1) #9, !dbg !107
  %add = add i64 %call, 1, !dbg !108
  %mul = mul i64 %add, 1, !dbg !109
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %2, i8* align 1 %arraydecay, i64 %mul, i1 false), !dbg !105
  %3 = load i8*, i8** %data, align 8, !dbg !110
  call void @printLine(i8* %3), !dbg !111
  %4 = load i8*, i8** %data, align 8, !dbg !112
  call void @free(i8* %4) #7, !dbg !113
  ret void, !dbg !114
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly nofree nounwind willreturn }
attributes #6 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }
attributes #9 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_45_badData", scope: !2, file: !13, line: 26, type: !6, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !10, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_45.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !8, !9}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{!0, !11}
!11 = !DIGlobalVariableExpression(var: !12, expr: !DIExpression())
!12 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_45_goodG2BData", scope: !2, file: !13, line: 27, type: !6, isLocal: true, isDefinition: true)
!13 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_45.c", directory: "/home/joelyang/SSE-Assessment")
!14 = !{i32 7, !"Dwarf Version", i32 4}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = !{i32 7, !"uwtable", i32 1}
!18 = !{i32 7, !"frame-pointer", i32 2}
!19 = !{!"clang version 13.0.0"}
!20 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_45_bad", scope: !13, file: !13, line: 44, type: !21, scopeLine: 45, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !DILocalVariable(name: "data", scope: !20, file: !13, line: 46, type: !6)
!24 = !DILocation(line: 46, column: 12, scope: !20)
!25 = !DILocation(line: 47, column: 10, scope: !20)
!26 = !DILocation(line: 49, column: 20, scope: !20)
!27 = !DILocation(line: 49, column: 10, scope: !20)
!28 = !DILocation(line: 50, column: 9, scope: !29)
!29 = distinct !DILexicalBlock(scope: !20, file: !13, line: 50, column: 9)
!30 = !DILocation(line: 50, column: 14, scope: !29)
!31 = !DILocation(line: 50, column: 9, scope: !20)
!32 = !DILocation(line: 50, column: 24, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !13, line: 50, column: 23)
!34 = !DILocation(line: 51, column: 74, scope: !20)
!35 = !DILocation(line: 51, column: 72, scope: !20)
!36 = !DILocation(line: 52, column: 5, scope: !20)
!37 = !DILocation(line: 53, column: 1, scope: !20)
!38 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_45_good", scope: !13, file: !13, line: 84, type: !21, scopeLine: 85, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!39 = !DILocation(line: 86, column: 5, scope: !38)
!40 = !DILocation(line: 87, column: 1, scope: !38)
!41 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 98, type: !42, scopeLine: 99, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!42 = !DISubroutineType(types: !43)
!43 = !{!44, !44, !45}
!44 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!45 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!46 = !DILocalVariable(name: "argc", arg: 1, scope: !41, file: !13, line: 98, type: !44)
!47 = !DILocation(line: 98, column: 14, scope: !41)
!48 = !DILocalVariable(name: "argv", arg: 2, scope: !41, file: !13, line: 98, type: !45)
!49 = !DILocation(line: 98, column: 27, scope: !41)
!50 = !DILocation(line: 101, column: 22, scope: !41)
!51 = !DILocation(line: 101, column: 12, scope: !41)
!52 = !DILocation(line: 101, column: 5, scope: !41)
!53 = !DILocation(line: 103, column: 5, scope: !41)
!54 = !DILocation(line: 104, column: 5, scope: !41)
!55 = !DILocation(line: 105, column: 5, scope: !41)
!56 = !DILocation(line: 108, column: 5, scope: !41)
!57 = !DILocation(line: 109, column: 5, scope: !41)
!58 = !DILocation(line: 110, column: 5, scope: !41)
!59 = !DILocation(line: 112, column: 5, scope: !41)
!60 = distinct !DISubprogram(name: "badSink", scope: !13, file: !13, line: 31, type: !21, scopeLine: 32, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!61 = !DILocalVariable(name: "data", scope: !60, file: !13, line: 33, type: !6)
!62 = !DILocation(line: 33, column: 12, scope: !60)
!63 = !DILocation(line: 33, column: 19, scope: !60)
!64 = !DILocalVariable(name: "source", scope: !65, file: !13, line: 35, type: !66)
!65 = distinct !DILexicalBlock(scope: !60, file: !13, line: 34, column: 5)
!66 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 88, elements: !67)
!67 = !{!68}
!68 = !DISubrange(count: 11)
!69 = !DILocation(line: 35, column: 14, scope: !65)
!70 = !DILocation(line: 38, column: 16, scope: !65)
!71 = !DILocation(line: 38, column: 9, scope: !65)
!72 = !DILocation(line: 38, column: 38, scope: !65)
!73 = !DILocation(line: 38, column: 31, scope: !65)
!74 = !DILocation(line: 38, column: 46, scope: !65)
!75 = !DILocation(line: 38, column: 51, scope: !65)
!76 = !DILocation(line: 39, column: 19, scope: !65)
!77 = !DILocation(line: 39, column: 9, scope: !65)
!78 = !DILocation(line: 40, column: 14, scope: !65)
!79 = !DILocation(line: 40, column: 9, scope: !65)
!80 = !DILocation(line: 42, column: 1, scope: !60)
!81 = distinct !DISubprogram(name: "goodG2B", scope: !13, file: !13, line: 73, type: !21, scopeLine: 74, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!82 = !DILocalVariable(name: "data", scope: !81, file: !13, line: 75, type: !6)
!83 = !DILocation(line: 75, column: 12, scope: !81)
!84 = !DILocation(line: 76, column: 10, scope: !81)
!85 = !DILocation(line: 78, column: 20, scope: !81)
!86 = !DILocation(line: 78, column: 10, scope: !81)
!87 = !DILocation(line: 79, column: 9, scope: !88)
!88 = distinct !DILexicalBlock(scope: !81, file: !13, line: 79, column: 9)
!89 = !DILocation(line: 79, column: 14, scope: !88)
!90 = !DILocation(line: 79, column: 9, scope: !81)
!91 = !DILocation(line: 79, column: 24, scope: !92)
!92 = distinct !DILexicalBlock(scope: !88, file: !13, line: 79, column: 23)
!93 = !DILocation(line: 80, column: 78, scope: !81)
!94 = !DILocation(line: 80, column: 76, scope: !81)
!95 = !DILocation(line: 81, column: 5, scope: !81)
!96 = !DILocation(line: 82, column: 1, scope: !81)
!97 = distinct !DISubprogram(name: "goodG2BSink", scope: !13, file: !13, line: 60, type: !21, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!98 = !DILocalVariable(name: "data", scope: !97, file: !13, line: 62, type: !6)
!99 = !DILocation(line: 62, column: 12, scope: !97)
!100 = !DILocation(line: 62, column: 19, scope: !97)
!101 = !DILocalVariable(name: "source", scope: !102, file: !13, line: 64, type: !66)
!102 = distinct !DILexicalBlock(scope: !97, file: !13, line: 63, column: 5)
!103 = !DILocation(line: 64, column: 14, scope: !102)
!104 = !DILocation(line: 67, column: 16, scope: !102)
!105 = !DILocation(line: 67, column: 9, scope: !102)
!106 = !DILocation(line: 67, column: 38, scope: !102)
!107 = !DILocation(line: 67, column: 31, scope: !102)
!108 = !DILocation(line: 67, column: 46, scope: !102)
!109 = !DILocation(line: 67, column: 51, scope: !102)
!110 = !DILocation(line: 68, column: 19, scope: !102)
!111 = !DILocation(line: 68, column: 9, scope: !102)
!112 = !DILocation(line: 69, column: 14, scope: !102)
!113 = !DILocation(line: 69, column: 9, scope: !102)
!114 = !DILocation(line: 71, column: 1, scope: !97)
