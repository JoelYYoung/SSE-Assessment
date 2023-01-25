; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memmove_44.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memmove_44.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.badSink.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@__const.goodG2BSink.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memmove_44_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %funcPtr = alloca void (i8*)*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata void (i8*)** %funcPtr, metadata !20, metadata !DIExpression()), !dbg !24
  store void (i8*)* @badSink, void (i8*)** %funcPtr, align 8, !dbg !24
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
  %1 = load void (i8*)*, void (i8*)** %funcPtr, align 8, !dbg !34
  %2 = load i8*, i8** %data, align 8, !dbg !35
  call void %1(i8* %2), !dbg !34
  ret void, !dbg !36
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal void @badSink(i8* %data) #0 !dbg !37 {
entry:
  %data.addr = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !38, metadata !DIExpression()), !dbg !39
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !40, metadata !DIExpression()), !dbg !45
  %0 = bitcast [11 x i8]* %source to i8*, !dbg !45
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %0, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.badSink.source, i32 0, i32 0), i64 11, i1 false), !dbg !45
  %1 = load i8*, i8** %data.addr, align 8, !dbg !46
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !47
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !48
  %call = call i64 @strlen(i8* %arraydecay1) #9, !dbg !49
  %add = add i64 %call, 1, !dbg !50
  %mul = mul i64 %add, 1, !dbg !51
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 %arraydecay, i64 %mul, i1 false), !dbg !47
  %2 = load i8*, i8** %data.addr, align 8, !dbg !52
  call void @printLine(i8* %2), !dbg !53
  %3 = load i8*, i8** %data.addr, align 8, !dbg !54
  call void @free(i8* %3) #7, !dbg !55
  ret void, !dbg !56
}

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memmove_44_good() #0 !dbg !57 {
entry:
  call void @goodG2B(), !dbg !58
  ret void, !dbg !59
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !60 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !65, metadata !DIExpression()), !dbg !66
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !67, metadata !DIExpression()), !dbg !68
  %call = call i64 @time(i64* null) #7, !dbg !69
  %conv = trunc i64 %call to i32, !dbg !70
  call void @srand(i32 %conv) #7, !dbg !71
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !72
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memmove_44_good(), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !75
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memmove_44_bad(), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !77
  ret i32 0, !dbg !78
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #5

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #6

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !79 {
entry:
  %data = alloca i8*, align 8
  %funcPtr = alloca void (i8*)*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !80, metadata !DIExpression()), !dbg !81
  call void @llvm.dbg.declare(metadata void (i8*)** %funcPtr, metadata !82, metadata !DIExpression()), !dbg !83
  store void (i8*)* @goodG2BSink, void (i8*)** %funcPtr, align 8, !dbg !83
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
  %1 = load void (i8*)*, void (i8*)** %funcPtr, align 8, !dbg !93
  %2 = load i8*, i8** %data, align 8, !dbg !94
  call void %1(i8* %2), !dbg !93
  ret void, !dbg !95
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink(i8* %data) #0 !dbg !96 {
entry:
  %data.addr = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !97, metadata !DIExpression()), !dbg !98
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !99, metadata !DIExpression()), !dbg !101
  %0 = bitcast [11 x i8]* %source to i8*, !dbg !101
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %0, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2BSink.source, i32 0, i32 0), i64 11, i1 false), !dbg !101
  %1 = load i8*, i8** %data.addr, align 8, !dbg !102
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !103
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !104
  %call = call i64 @strlen(i8* %arraydecay1) #9, !dbg !105
  %add = add i64 %call, 1, !dbg !106
  %mul = mul i64 %add, 1, !dbg !107
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 %arraydecay, i64 %mul, i1 false), !dbg !103
  %2 = load i8*, i8** %data.addr, align 8, !dbg !108
  call void @printLine(i8* %2), !dbg !109
  %3 = load i8*, i8** %data.addr, align 8, !dbg !110
  call void @free(i8* %3) #7, !dbg !111
  ret void, !dbg !112
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

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memmove_44.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memmove_44_bad", scope: !15, file: !15, line: 40, type: !16, scopeLine: 41, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memmove_44.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 42, type: !4)
!19 = !DILocation(line: 42, column: 12, scope: !14)
!20 = !DILocalVariable(name: "funcPtr", scope: !14, file: !15, line: 44, type: !21)
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !22, size: 64)
!22 = !DISubroutineType(types: !23)
!23 = !{null, !4}
!24 = !DILocation(line: 44, column: 12, scope: !14)
!25 = !DILocation(line: 45, column: 10, scope: !14)
!26 = !DILocation(line: 47, column: 20, scope: !14)
!27 = !DILocation(line: 47, column: 10, scope: !14)
!28 = !DILocation(line: 48, column: 9, scope: !29)
!29 = distinct !DILexicalBlock(scope: !14, file: !15, line: 48, column: 9)
!30 = !DILocation(line: 48, column: 14, scope: !29)
!31 = !DILocation(line: 48, column: 9, scope: !14)
!32 = !DILocation(line: 48, column: 24, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !15, line: 48, column: 23)
!34 = !DILocation(line: 50, column: 5, scope: !14)
!35 = !DILocation(line: 50, column: 13, scope: !14)
!36 = !DILocation(line: 51, column: 1, scope: !14)
!37 = distinct !DISubprogram(name: "badSink", scope: !15, file: !15, line: 28, type: !22, scopeLine: 29, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!38 = !DILocalVariable(name: "data", arg: 1, scope: !37, file: !15, line: 28, type: !4)
!39 = !DILocation(line: 28, column: 28, scope: !37)
!40 = !DILocalVariable(name: "source", scope: !41, file: !15, line: 31, type: !42)
!41 = distinct !DILexicalBlock(scope: !37, file: !15, line: 30, column: 5)
!42 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 88, elements: !43)
!43 = !{!44}
!44 = !DISubrange(count: 11)
!45 = !DILocation(line: 31, column: 14, scope: !41)
!46 = !DILocation(line: 34, column: 17, scope: !41)
!47 = !DILocation(line: 34, column: 9, scope: !41)
!48 = !DILocation(line: 34, column: 39, scope: !41)
!49 = !DILocation(line: 34, column: 32, scope: !41)
!50 = !DILocation(line: 34, column: 47, scope: !41)
!51 = !DILocation(line: 34, column: 52, scope: !41)
!52 = !DILocation(line: 35, column: 19, scope: !41)
!53 = !DILocation(line: 35, column: 9, scope: !41)
!54 = !DILocation(line: 36, column: 14, scope: !41)
!55 = !DILocation(line: 36, column: 9, scope: !41)
!56 = !DILocation(line: 38, column: 1, scope: !37)
!57 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memmove_44_good", scope: !15, file: !15, line: 81, type: !16, scopeLine: 82, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!58 = !DILocation(line: 83, column: 5, scope: !57)
!59 = !DILocation(line: 84, column: 1, scope: !57)
!60 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 95, type: !61, scopeLine: 96, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!61 = !DISubroutineType(types: !62)
!62 = !{!63, !63, !64}
!63 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!65 = !DILocalVariable(name: "argc", arg: 1, scope: !60, file: !15, line: 95, type: !63)
!66 = !DILocation(line: 95, column: 14, scope: !60)
!67 = !DILocalVariable(name: "argv", arg: 2, scope: !60, file: !15, line: 95, type: !64)
!68 = !DILocation(line: 95, column: 27, scope: !60)
!69 = !DILocation(line: 98, column: 22, scope: !60)
!70 = !DILocation(line: 98, column: 12, scope: !60)
!71 = !DILocation(line: 98, column: 5, scope: !60)
!72 = !DILocation(line: 100, column: 5, scope: !60)
!73 = !DILocation(line: 101, column: 5, scope: !60)
!74 = !DILocation(line: 102, column: 5, scope: !60)
!75 = !DILocation(line: 105, column: 5, scope: !60)
!76 = !DILocation(line: 106, column: 5, scope: !60)
!77 = !DILocation(line: 107, column: 5, scope: !60)
!78 = !DILocation(line: 109, column: 5, scope: !60)
!79 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 70, type: !16, scopeLine: 71, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!80 = !DILocalVariable(name: "data", scope: !79, file: !15, line: 72, type: !4)
!81 = !DILocation(line: 72, column: 12, scope: !79)
!82 = !DILocalVariable(name: "funcPtr", scope: !79, file: !15, line: 73, type: !21)
!83 = !DILocation(line: 73, column: 12, scope: !79)
!84 = !DILocation(line: 74, column: 10, scope: !79)
!85 = !DILocation(line: 76, column: 20, scope: !79)
!86 = !DILocation(line: 76, column: 10, scope: !79)
!87 = !DILocation(line: 77, column: 9, scope: !88)
!88 = distinct !DILexicalBlock(scope: !79, file: !15, line: 77, column: 9)
!89 = !DILocation(line: 77, column: 14, scope: !88)
!90 = !DILocation(line: 77, column: 9, scope: !79)
!91 = !DILocation(line: 77, column: 24, scope: !92)
!92 = distinct !DILexicalBlock(scope: !88, file: !15, line: 77, column: 23)
!93 = !DILocation(line: 78, column: 5, scope: !79)
!94 = !DILocation(line: 78, column: 13, scope: !79)
!95 = !DILocation(line: 79, column: 1, scope: !79)
!96 = distinct !DISubprogram(name: "goodG2BSink", scope: !15, file: !15, line: 58, type: !22, scopeLine: 59, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!97 = !DILocalVariable(name: "data", arg: 1, scope: !96, file: !15, line: 58, type: !4)
!98 = !DILocation(line: 58, column: 32, scope: !96)
!99 = !DILocalVariable(name: "source", scope: !100, file: !15, line: 61, type: !42)
!100 = distinct !DILexicalBlock(scope: !96, file: !15, line: 60, column: 5)
!101 = !DILocation(line: 61, column: 14, scope: !100)
!102 = !DILocation(line: 64, column: 17, scope: !100)
!103 = !DILocation(line: 64, column: 9, scope: !100)
!104 = !DILocation(line: 64, column: 39, scope: !100)
!105 = !DILocation(line: 64, column: 32, scope: !100)
!106 = !DILocation(line: 64, column: 47, scope: !100)
!107 = !DILocation(line: 64, column: 52, scope: !100)
!108 = !DILocation(line: 65, column: 19, scope: !100)
!109 = !DILocation(line: 65, column: 9, scope: !100)
!110 = !DILocation(line: 66, column: 14, scope: !100)
!111 = !DILocation(line: 66, column: 9, scope: !100)
!112 = !DILocation(line: 68, column: 1, scope: !96)
