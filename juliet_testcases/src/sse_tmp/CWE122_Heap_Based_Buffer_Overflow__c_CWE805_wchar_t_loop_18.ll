; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_18.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_18.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_18_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  %source1 = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  store i32* null, i32** %data, align 8, !dbg !22
  br label %source, !dbg !23

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !24), !dbg !25
  %call = call noalias align 16 i8* @malloc(i64 200) #5, !dbg !26
  %0 = bitcast i8* %call to i32*, !dbg !27
  store i32* %0, i32** %data, align 8, !dbg !28
  %1 = load i32*, i32** %data, align 8, !dbg !29
  %cmp = icmp eq i32* %1, null, !dbg !31
  br i1 %cmp, label %if.then, label %if.end, !dbg !32

if.then:                                          ; preds = %source
  call void @exit(i32 -1) #6, !dbg !33
  unreachable, !dbg !33

if.end:                                           ; preds = %source
  %2 = load i32*, i32** %data, align 8, !dbg !35
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0, !dbg !35
  store i32 0, i32* %arrayidx, align 4, !dbg !36
  call void @llvm.dbg.declare(metadata i64* %i, metadata !37, metadata !DIExpression()), !dbg !41
  call void @llvm.dbg.declare(metadata [100 x i32]* %source1, metadata !42, metadata !DIExpression()), !dbg !46
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source1, i64 0, i64 0, !dbg !47
  %call2 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !48
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source1, i64 0, i64 99, !dbg !49
  store i32 0, i32* %arrayidx3, align 4, !dbg !50
  store i64 0, i64* %i, align 8, !dbg !51
  br label %for.cond, !dbg !53

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !54
  %cmp4 = icmp ult i64 %3, 100, !dbg !56
  br i1 %cmp4, label %for.body, label %for.end, !dbg !57

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !58
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %source1, i64 0, i64 %4, !dbg !60
  %5 = load i32, i32* %arrayidx5, align 4, !dbg !60
  %6 = load i32*, i32** %data, align 8, !dbg !61
  %7 = load i64, i64* %i, align 8, !dbg !62
  %arrayidx6 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !61
  store i32 %5, i32* %arrayidx6, align 4, !dbg !63
  br label %for.inc, !dbg !64

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !65
  %inc = add i64 %8, 1, !dbg !65
  store i64 %inc, i64* %i, align 8, !dbg !65
  br label %for.cond, !dbg !66, !llvm.loop !67

for.end:                                          ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !70
  %arrayidx7 = getelementptr inbounds i32, i32* %9, i64 99, !dbg !70
  store i32 0, i32* %arrayidx7, align 4, !dbg !71
  %10 = load i32*, i32** %data, align 8, !dbg !72
  call void @printWLine(i32* %10), !dbg !73
  %11 = load i32*, i32** %data, align 8, !dbg !74
  %12 = bitcast i32* %11 to i8*, !dbg !74
  call void @free(i8* %12) #5, !dbg !75
  ret void, !dbg !76
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

declare dso_local void @printWLine(i32*) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_18_good() #0 !dbg !77 {
entry:
  call void @goodG2B(), !dbg !78
  ret void, !dbg !79
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !80 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !86, metadata !DIExpression()), !dbg !87
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !88, metadata !DIExpression()), !dbg !89
  %call = call i64 @time(i64* null) #5, !dbg !90
  %conv = trunc i64 %call to i32, !dbg !91
  call void @srand(i32 %conv) #5, !dbg !92
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !93
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_18_good(), !dbg !94
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !95
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !96
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_18_bad(), !dbg !97
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !98
  ret i32 0, !dbg !99
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !100 {
entry:
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  %source1 = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !101, metadata !DIExpression()), !dbg !102
  store i32* null, i32** %data, align 8, !dbg !103
  br label %source, !dbg !104

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !105), !dbg !106
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !107
  %0 = bitcast i8* %call to i32*, !dbg !108
  store i32* %0, i32** %data, align 8, !dbg !109
  %1 = load i32*, i32** %data, align 8, !dbg !110
  %cmp = icmp eq i32* %1, null, !dbg !112
  br i1 %cmp, label %if.then, label %if.end, !dbg !113

if.then:                                          ; preds = %source
  call void @exit(i32 -1) #6, !dbg !114
  unreachable, !dbg !114

if.end:                                           ; preds = %source
  %2 = load i32*, i32** %data, align 8, !dbg !116
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0, !dbg !116
  store i32 0, i32* %arrayidx, align 4, !dbg !117
  call void @llvm.dbg.declare(metadata i64* %i, metadata !118, metadata !DIExpression()), !dbg !120
  call void @llvm.dbg.declare(metadata [100 x i32]* %source1, metadata !121, metadata !DIExpression()), !dbg !122
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source1, i64 0, i64 0, !dbg !123
  %call2 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !124
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source1, i64 0, i64 99, !dbg !125
  store i32 0, i32* %arrayidx3, align 4, !dbg !126
  store i64 0, i64* %i, align 8, !dbg !127
  br label %for.cond, !dbg !129

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !130
  %cmp4 = icmp ult i64 %3, 100, !dbg !132
  br i1 %cmp4, label %for.body, label %for.end, !dbg !133

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !134
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %source1, i64 0, i64 %4, !dbg !136
  %5 = load i32, i32* %arrayidx5, align 4, !dbg !136
  %6 = load i32*, i32** %data, align 8, !dbg !137
  %7 = load i64, i64* %i, align 8, !dbg !138
  %arrayidx6 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !137
  store i32 %5, i32* %arrayidx6, align 4, !dbg !139
  br label %for.inc, !dbg !140

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !141
  %inc = add i64 %8, 1, !dbg !141
  store i64 %inc, i64* %i, align 8, !dbg !141
  br label %for.cond, !dbg !142, !llvm.loop !143

for.end:                                          ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !145
  %arrayidx7 = getelementptr inbounds i32, i32* %9, i64 99, !dbg !145
  store i32 0, i32* %arrayidx7, align 4, !dbg !146
  %10 = load i32*, i32** %data, align 8, !dbg !147
  call void @printWLine(i32* %10), !dbg !148
  %11 = load i32*, i32** %data, align 8, !dbg !149
  %12 = bitcast i32* %11 to i8*, !dbg !149
  call void @free(i8* %12) #5, !dbg !150
  ret void, !dbg !151
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_18.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !8, !9}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !6, line: 74, baseType: !7)
!6 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"clang version 13.0.0"}
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_18_bad", scope: !17, file: !17, line: 23, type: !18, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_18.c", directory: "/root/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 25, type: !4)
!21 = !DILocation(line: 25, column: 15, scope: !16)
!22 = !DILocation(line: 26, column: 10, scope: !16)
!23 = !DILocation(line: 27, column: 5, scope: !16)
!24 = !DILabel(scope: !16, name: "source", file: !17, line: 28)
!25 = !DILocation(line: 28, column: 1, scope: !16)
!26 = !DILocation(line: 30, column: 23, scope: !16)
!27 = !DILocation(line: 30, column: 12, scope: !16)
!28 = !DILocation(line: 30, column: 10, scope: !16)
!29 = !DILocation(line: 31, column: 9, scope: !30)
!30 = distinct !DILexicalBlock(scope: !16, file: !17, line: 31, column: 9)
!31 = !DILocation(line: 31, column: 14, scope: !30)
!32 = !DILocation(line: 31, column: 9, scope: !16)
!33 = !DILocation(line: 31, column: 24, scope: !34)
!34 = distinct !DILexicalBlock(scope: !30, file: !17, line: 31, column: 23)
!35 = !DILocation(line: 32, column: 5, scope: !16)
!36 = !DILocation(line: 32, column: 13, scope: !16)
!37 = !DILocalVariable(name: "i", scope: !38, file: !17, line: 34, type: !39)
!38 = distinct !DILexicalBlock(scope: !16, file: !17, line: 33, column: 5)
!39 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !6, line: 46, baseType: !40)
!40 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!41 = !DILocation(line: 34, column: 16, scope: !38)
!42 = !DILocalVariable(name: "source", scope: !38, file: !17, line: 35, type: !43)
!43 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !44)
!44 = !{!45}
!45 = !DISubrange(count: 100)
!46 = !DILocation(line: 35, column: 17, scope: !38)
!47 = !DILocation(line: 36, column: 17, scope: !38)
!48 = !DILocation(line: 36, column: 9, scope: !38)
!49 = !DILocation(line: 37, column: 9, scope: !38)
!50 = !DILocation(line: 37, column: 23, scope: !38)
!51 = !DILocation(line: 39, column: 16, scope: !52)
!52 = distinct !DILexicalBlock(scope: !38, file: !17, line: 39, column: 9)
!53 = !DILocation(line: 39, column: 14, scope: !52)
!54 = !DILocation(line: 39, column: 21, scope: !55)
!55 = distinct !DILexicalBlock(scope: !52, file: !17, line: 39, column: 9)
!56 = !DILocation(line: 39, column: 23, scope: !55)
!57 = !DILocation(line: 39, column: 9, scope: !52)
!58 = !DILocation(line: 41, column: 30, scope: !59)
!59 = distinct !DILexicalBlock(scope: !55, file: !17, line: 40, column: 9)
!60 = !DILocation(line: 41, column: 23, scope: !59)
!61 = !DILocation(line: 41, column: 13, scope: !59)
!62 = !DILocation(line: 41, column: 18, scope: !59)
!63 = !DILocation(line: 41, column: 21, scope: !59)
!64 = !DILocation(line: 42, column: 9, scope: !59)
!65 = !DILocation(line: 39, column: 31, scope: !55)
!66 = !DILocation(line: 39, column: 9, scope: !55)
!67 = distinct !{!67, !57, !68, !69}
!68 = !DILocation(line: 42, column: 9, scope: !52)
!69 = !{!"llvm.loop.mustprogress"}
!70 = !DILocation(line: 43, column: 9, scope: !38)
!71 = !DILocation(line: 43, column: 21, scope: !38)
!72 = !DILocation(line: 44, column: 20, scope: !38)
!73 = !DILocation(line: 44, column: 9, scope: !38)
!74 = !DILocation(line: 45, column: 14, scope: !38)
!75 = !DILocation(line: 45, column: 9, scope: !38)
!76 = !DILocation(line: 47, column: 1, scope: !16)
!77 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_18_good", scope: !17, file: !17, line: 80, type: !18, scopeLine: 81, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!78 = !DILocation(line: 82, column: 5, scope: !77)
!79 = !DILocation(line: 83, column: 1, scope: !77)
!80 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 95, type: !81, scopeLine: 96, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!81 = !DISubroutineType(types: !82)
!82 = !{!7, !7, !83}
!83 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !84, size: 64)
!84 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !85, size: 64)
!85 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!86 = !DILocalVariable(name: "argc", arg: 1, scope: !80, file: !17, line: 95, type: !7)
!87 = !DILocation(line: 95, column: 14, scope: !80)
!88 = !DILocalVariable(name: "argv", arg: 2, scope: !80, file: !17, line: 95, type: !83)
!89 = !DILocation(line: 95, column: 27, scope: !80)
!90 = !DILocation(line: 98, column: 22, scope: !80)
!91 = !DILocation(line: 98, column: 12, scope: !80)
!92 = !DILocation(line: 98, column: 5, scope: !80)
!93 = !DILocation(line: 100, column: 5, scope: !80)
!94 = !DILocation(line: 101, column: 5, scope: !80)
!95 = !DILocation(line: 102, column: 5, scope: !80)
!96 = !DILocation(line: 105, column: 5, scope: !80)
!97 = !DILocation(line: 106, column: 5, scope: !80)
!98 = !DILocation(line: 107, column: 5, scope: !80)
!99 = !DILocation(line: 109, column: 5, scope: !80)
!100 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 54, type: !18, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!101 = !DILocalVariable(name: "data", scope: !100, file: !17, line: 56, type: !4)
!102 = !DILocation(line: 56, column: 15, scope: !100)
!103 = !DILocation(line: 57, column: 10, scope: !100)
!104 = !DILocation(line: 58, column: 5, scope: !100)
!105 = !DILabel(scope: !100, name: "source", file: !17, line: 59)
!106 = !DILocation(line: 59, column: 1, scope: !100)
!107 = !DILocation(line: 61, column: 23, scope: !100)
!108 = !DILocation(line: 61, column: 12, scope: !100)
!109 = !DILocation(line: 61, column: 10, scope: !100)
!110 = !DILocation(line: 62, column: 9, scope: !111)
!111 = distinct !DILexicalBlock(scope: !100, file: !17, line: 62, column: 9)
!112 = !DILocation(line: 62, column: 14, scope: !111)
!113 = !DILocation(line: 62, column: 9, scope: !100)
!114 = !DILocation(line: 62, column: 24, scope: !115)
!115 = distinct !DILexicalBlock(scope: !111, file: !17, line: 62, column: 23)
!116 = !DILocation(line: 63, column: 5, scope: !100)
!117 = !DILocation(line: 63, column: 13, scope: !100)
!118 = !DILocalVariable(name: "i", scope: !119, file: !17, line: 65, type: !39)
!119 = distinct !DILexicalBlock(scope: !100, file: !17, line: 64, column: 5)
!120 = !DILocation(line: 65, column: 16, scope: !119)
!121 = !DILocalVariable(name: "source", scope: !119, file: !17, line: 66, type: !43)
!122 = !DILocation(line: 66, column: 17, scope: !119)
!123 = !DILocation(line: 67, column: 17, scope: !119)
!124 = !DILocation(line: 67, column: 9, scope: !119)
!125 = !DILocation(line: 68, column: 9, scope: !119)
!126 = !DILocation(line: 68, column: 23, scope: !119)
!127 = !DILocation(line: 70, column: 16, scope: !128)
!128 = distinct !DILexicalBlock(scope: !119, file: !17, line: 70, column: 9)
!129 = !DILocation(line: 70, column: 14, scope: !128)
!130 = !DILocation(line: 70, column: 21, scope: !131)
!131 = distinct !DILexicalBlock(scope: !128, file: !17, line: 70, column: 9)
!132 = !DILocation(line: 70, column: 23, scope: !131)
!133 = !DILocation(line: 70, column: 9, scope: !128)
!134 = !DILocation(line: 72, column: 30, scope: !135)
!135 = distinct !DILexicalBlock(scope: !131, file: !17, line: 71, column: 9)
!136 = !DILocation(line: 72, column: 23, scope: !135)
!137 = !DILocation(line: 72, column: 13, scope: !135)
!138 = !DILocation(line: 72, column: 18, scope: !135)
!139 = !DILocation(line: 72, column: 21, scope: !135)
!140 = !DILocation(line: 73, column: 9, scope: !135)
!141 = !DILocation(line: 70, column: 31, scope: !131)
!142 = !DILocation(line: 70, column: 9, scope: !131)
!143 = distinct !{!143, !133, !144, !69}
!144 = !DILocation(line: 73, column: 9, scope: !128)
!145 = !DILocation(line: 74, column: 9, scope: !119)
!146 = !DILocation(line: 74, column: 21, scope: !119)
!147 = !DILocation(line: 75, column: 20, scope: !119)
!148 = !DILocation(line: 75, column: 9, scope: !119)
!149 = !DILocation(line: 76, column: 14, scope: !119)
!150 = !DILocation(line: 76, column: 9, scope: !119)
!151 = !DILocation(line: 78, column: 1, scope: !100)
