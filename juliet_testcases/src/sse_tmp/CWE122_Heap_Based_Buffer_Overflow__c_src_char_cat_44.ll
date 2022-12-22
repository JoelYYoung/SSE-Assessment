; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_44.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_44.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_44_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %funcPtr = alloca void (i8*)*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata void (i8*)** %funcPtr, metadata !20, metadata !DIExpression()), !dbg !24
  store void (i8*)* @badSink, void (i8*)** %funcPtr, align 8, !dbg !24
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !25
  store i8* %call, i8** %data, align 8, !dbg !26
  %0 = load i8*, i8** %data, align 8, !dbg !27
  %cmp = icmp eq i8* %0, null, !dbg !29
  br i1 %cmp, label %if.then, label %if.end, !dbg !30

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !31
  unreachable, !dbg !31

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !33
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !34
  %2 = load i8*, i8** %data, align 8, !dbg !35
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !35
  store i8 0, i8* %arrayidx, align 1, !dbg !36
  %3 = load void (i8*)*, void (i8*)** %funcPtr, align 8, !dbg !37
  %4 = load i8*, i8** %data, align 8, !dbg !38
  call void %3(i8* %4), !dbg !37
  ret void, !dbg !39
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal void @badSink(i8* %data) #0 !dbg !40 {
entry:
  %data.addr = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !41, metadata !DIExpression()), !dbg !42
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !43, metadata !DIExpression()), !dbg !48
  %0 = bitcast [50 x i8]* %dest to i8*, !dbg !48
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 50, i1 false), !dbg !48
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !49
  %1 = load i8*, i8** %data.addr, align 8, !dbg !50
  %call = call i8* @strcat(i8* %arraydecay, i8* %1) #6, !dbg !51
  %2 = load i8*, i8** %data.addr, align 8, !dbg !52
  call void @printLine(i8* %2), !dbg !53
  %3 = load i8*, i8** %data.addr, align 8, !dbg !54
  call void @free(i8* %3) #6, !dbg !55
  ret void, !dbg !56
}

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_44_good() #0 !dbg !57 {
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
  %call = call i64 @time(i64* null) #6, !dbg !69
  %conv = trunc i64 %call to i32, !dbg !70
  call void @srand(i32 %conv) #6, !dbg !71
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !72
  call void @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_44_good(), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !75
  call void @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_44_bad(), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !77
  ret i32 0, !dbg !78
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: nounwind
declare dso_local i8* @strcat(i8*, i8*) #2

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
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !84
  store i8* %call, i8** %data, align 8, !dbg !85
  %0 = load i8*, i8** %data, align 8, !dbg !86
  %cmp = icmp eq i8* %0, null, !dbg !88
  br i1 %cmp, label %if.then, label %if.end, !dbg !89

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !90
  unreachable, !dbg !90

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !92
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 49, i1 false), !dbg !93
  %2 = load i8*, i8** %data, align 8, !dbg !94
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 49, !dbg !94
  store i8 0, i8* %arrayidx, align 1, !dbg !95
  %3 = load void (i8*)*, void (i8*)** %funcPtr, align 8, !dbg !96
  %4 = load i8*, i8** %data, align 8, !dbg !97
  call void %3(i8* %4), !dbg !96
  ret void, !dbg !98
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink(i8* %data) #0 !dbg !99 {
entry:
  %data.addr = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !100, metadata !DIExpression()), !dbg !101
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !102, metadata !DIExpression()), !dbg !104
  %0 = bitcast [50 x i8]* %dest to i8*, !dbg !104
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 50, i1 false), !dbg !104
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !105
  %1 = load i8*, i8** %data.addr, align 8, !dbg !106
  %call = call i8* @strcat(i8* %arraydecay, i8* %1) #6, !dbg !107
  %2 = load i8*, i8** %data.addr, align 8, !dbg !108
  call void @printLine(i8* %2), !dbg !109
  %3 = load i8*, i8** %data.addr, align 8, !dbg !110
  call void @free(i8* %3) #6, !dbg !111
  ret void, !dbg !112
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_44.c", directory: "/root/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_44_bad", scope: !15, file: !15, line: 34, type: !16, scopeLine: 35, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_44.c", directory: "/root/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 36, type: !4)
!19 = !DILocation(line: 36, column: 12, scope: !14)
!20 = !DILocalVariable(name: "funcPtr", scope: !14, file: !15, line: 38, type: !21)
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !22, size: 64)
!22 = !DISubroutineType(types: !23)
!23 = !{null, !4}
!24 = !DILocation(line: 38, column: 12, scope: !14)
!25 = !DILocation(line: 39, column: 20, scope: !14)
!26 = !DILocation(line: 39, column: 10, scope: !14)
!27 = !DILocation(line: 40, column: 9, scope: !28)
!28 = distinct !DILexicalBlock(scope: !14, file: !15, line: 40, column: 9)
!29 = !DILocation(line: 40, column: 14, scope: !28)
!30 = !DILocation(line: 40, column: 9, scope: !14)
!31 = !DILocation(line: 40, column: 24, scope: !32)
!32 = distinct !DILexicalBlock(scope: !28, file: !15, line: 40, column: 23)
!33 = !DILocation(line: 42, column: 12, scope: !14)
!34 = !DILocation(line: 42, column: 5, scope: !14)
!35 = !DILocation(line: 43, column: 5, scope: !14)
!36 = !DILocation(line: 43, column: 17, scope: !14)
!37 = !DILocation(line: 45, column: 5, scope: !14)
!38 = !DILocation(line: 45, column: 13, scope: !14)
!39 = !DILocation(line: 46, column: 1, scope: !14)
!40 = distinct !DISubprogram(name: "badSink", scope: !15, file: !15, line: 23, type: !22, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!41 = !DILocalVariable(name: "data", arg: 1, scope: !40, file: !15, line: 23, type: !4)
!42 = !DILocation(line: 23, column: 28, scope: !40)
!43 = !DILocalVariable(name: "dest", scope: !44, file: !15, line: 26, type: !45)
!44 = distinct !DILexicalBlock(scope: !40, file: !15, line: 25, column: 5)
!45 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 400, elements: !46)
!46 = !{!47}
!47 = !DISubrange(count: 50)
!48 = !DILocation(line: 26, column: 14, scope: !44)
!49 = !DILocation(line: 28, column: 16, scope: !44)
!50 = !DILocation(line: 28, column: 22, scope: !44)
!51 = !DILocation(line: 28, column: 9, scope: !44)
!52 = !DILocation(line: 29, column: 19, scope: !44)
!53 = !DILocation(line: 29, column: 9, scope: !44)
!54 = !DILocation(line: 30, column: 14, scope: !44)
!55 = !DILocation(line: 30, column: 9, scope: !44)
!56 = !DILocation(line: 32, column: 1, scope: !40)
!57 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_44_good", scope: !15, file: !15, line: 76, type: !16, scopeLine: 77, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!58 = !DILocation(line: 78, column: 5, scope: !57)
!59 = !DILocation(line: 79, column: 1, scope: !57)
!60 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 90, type: !61, scopeLine: 91, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!61 = !DISubroutineType(types: !62)
!62 = !{!63, !63, !64}
!63 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!65 = !DILocalVariable(name: "argc", arg: 1, scope: !60, file: !15, line: 90, type: !63)
!66 = !DILocation(line: 90, column: 14, scope: !60)
!67 = !DILocalVariable(name: "argv", arg: 2, scope: !60, file: !15, line: 90, type: !64)
!68 = !DILocation(line: 90, column: 27, scope: !60)
!69 = !DILocation(line: 93, column: 22, scope: !60)
!70 = !DILocation(line: 93, column: 12, scope: !60)
!71 = !DILocation(line: 93, column: 5, scope: !60)
!72 = !DILocation(line: 95, column: 5, scope: !60)
!73 = !DILocation(line: 96, column: 5, scope: !60)
!74 = !DILocation(line: 97, column: 5, scope: !60)
!75 = !DILocation(line: 100, column: 5, scope: !60)
!76 = !DILocation(line: 101, column: 5, scope: !60)
!77 = !DILocation(line: 102, column: 5, scope: !60)
!78 = !DILocation(line: 104, column: 5, scope: !60)
!79 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 64, type: !16, scopeLine: 65, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!80 = !DILocalVariable(name: "data", scope: !79, file: !15, line: 66, type: !4)
!81 = !DILocation(line: 66, column: 12, scope: !79)
!82 = !DILocalVariable(name: "funcPtr", scope: !79, file: !15, line: 67, type: !21)
!83 = !DILocation(line: 67, column: 12, scope: !79)
!84 = !DILocation(line: 68, column: 20, scope: !79)
!85 = !DILocation(line: 68, column: 10, scope: !79)
!86 = !DILocation(line: 69, column: 9, scope: !87)
!87 = distinct !DILexicalBlock(scope: !79, file: !15, line: 69, column: 9)
!88 = !DILocation(line: 69, column: 14, scope: !87)
!89 = !DILocation(line: 69, column: 9, scope: !79)
!90 = !DILocation(line: 69, column: 24, scope: !91)
!91 = distinct !DILexicalBlock(scope: !87, file: !15, line: 69, column: 23)
!92 = !DILocation(line: 71, column: 12, scope: !79)
!93 = !DILocation(line: 71, column: 5, scope: !79)
!94 = !DILocation(line: 72, column: 5, scope: !79)
!95 = !DILocation(line: 72, column: 16, scope: !79)
!96 = !DILocation(line: 73, column: 5, scope: !79)
!97 = !DILocation(line: 73, column: 13, scope: !79)
!98 = !DILocation(line: 74, column: 1, scope: !79)
!99 = distinct !DISubprogram(name: "goodG2BSink", scope: !15, file: !15, line: 53, type: !22, scopeLine: 54, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!100 = !DILocalVariable(name: "data", arg: 1, scope: !99, file: !15, line: 53, type: !4)
!101 = !DILocation(line: 53, column: 32, scope: !99)
!102 = !DILocalVariable(name: "dest", scope: !103, file: !15, line: 56, type: !45)
!103 = distinct !DILexicalBlock(scope: !99, file: !15, line: 55, column: 5)
!104 = !DILocation(line: 56, column: 14, scope: !103)
!105 = !DILocation(line: 58, column: 16, scope: !103)
!106 = !DILocation(line: 58, column: 22, scope: !103)
!107 = !DILocation(line: 58, column: 9, scope: !103)
!108 = !DILocation(line: 59, column: 19, scope: !103)
!109 = !DILocation(line: 59, column: 9, scope: !103)
!110 = !DILocation(line: 60, column: 14, scope: !103)
!111 = !DILocation(line: 60, column: 9, scope: !103)
!112 = !DILocation(line: 62, column: 1, scope: !99)
