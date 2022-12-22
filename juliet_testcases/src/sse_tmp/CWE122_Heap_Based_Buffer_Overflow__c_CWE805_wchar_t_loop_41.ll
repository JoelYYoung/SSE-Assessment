; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_41.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_41.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_41_badSink(i32* %data) #0 !dbg !16 {
entry:
  %data.addr = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !20, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata i64* %i, metadata !22, metadata !DIExpression()), !dbg !26
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !27, metadata !DIExpression()), !dbg !31
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !32
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !33
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !34
  store i32 0, i32* %arrayidx, align 4, !dbg !35
  store i64 0, i64* %i, align 8, !dbg !36
  br label %for.cond, !dbg !38

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !39
  %cmp = icmp ult i64 %0, 100, !dbg !41
  br i1 %cmp, label %for.body, label %for.end, !dbg !42

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !43
  %arrayidx1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %1, !dbg !45
  %2 = load i32, i32* %arrayidx1, align 4, !dbg !45
  %3 = load i32*, i32** %data.addr, align 8, !dbg !46
  %4 = load i64, i64* %i, align 8, !dbg !47
  %arrayidx2 = getelementptr inbounds i32, i32* %3, i64 %4, !dbg !46
  store i32 %2, i32* %arrayidx2, align 4, !dbg !48
  br label %for.inc, !dbg !49

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !50
  %inc = add i64 %5, 1, !dbg !50
  store i64 %inc, i64* %i, align 8, !dbg !50
  br label %for.cond, !dbg !51, !llvm.loop !52

for.end:                                          ; preds = %for.cond
  %6 = load i32*, i32** %data.addr, align 8, !dbg !55
  %arrayidx3 = getelementptr inbounds i32, i32* %6, i64 99, !dbg !55
  store i32 0, i32* %arrayidx3, align 4, !dbg !56
  %7 = load i32*, i32** %data.addr, align 8, !dbg !57
  call void @printWLine(i32* %7), !dbg !58
  %8 = load i32*, i32** %data.addr, align 8, !dbg !59
  %9 = bitcast i32* %8 to i8*, !dbg !59
  call void @free(i8* %9) #5, !dbg !60
  ret void, !dbg !61
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_41_bad() #0 !dbg !62 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !65, metadata !DIExpression()), !dbg !66
  store i32* null, i32** %data, align 8, !dbg !67
  %call = call noalias align 16 i8* @malloc(i64 200) #5, !dbg !68
  %0 = bitcast i8* %call to i32*, !dbg !69
  store i32* %0, i32** %data, align 8, !dbg !70
  %1 = load i32*, i32** %data, align 8, !dbg !71
  %cmp = icmp eq i32* %1, null, !dbg !73
  br i1 %cmp, label %if.then, label %if.end, !dbg !74

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !75
  unreachable, !dbg !75

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !77
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0, !dbg !77
  store i32 0, i32* %arrayidx, align 4, !dbg !78
  %3 = load i32*, i32** %data, align 8, !dbg !79
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_41_badSink(i32* %3), !dbg !80
  ret void, !dbg !81
}

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_41_goodG2BSink(i32* %data) #0 !dbg !82 {
entry:
  %data.addr = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !83, metadata !DIExpression()), !dbg !84
  call void @llvm.dbg.declare(metadata i64* %i, metadata !85, metadata !DIExpression()), !dbg !87
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !88, metadata !DIExpression()), !dbg !89
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !90
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !91
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !92
  store i32 0, i32* %arrayidx, align 4, !dbg !93
  store i64 0, i64* %i, align 8, !dbg !94
  br label %for.cond, !dbg !96

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !97
  %cmp = icmp ult i64 %0, 100, !dbg !99
  br i1 %cmp, label %for.body, label %for.end, !dbg !100

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !101
  %arrayidx1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %1, !dbg !103
  %2 = load i32, i32* %arrayidx1, align 4, !dbg !103
  %3 = load i32*, i32** %data.addr, align 8, !dbg !104
  %4 = load i64, i64* %i, align 8, !dbg !105
  %arrayidx2 = getelementptr inbounds i32, i32* %3, i64 %4, !dbg !104
  store i32 %2, i32* %arrayidx2, align 4, !dbg !106
  br label %for.inc, !dbg !107

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !108
  %inc = add i64 %5, 1, !dbg !108
  store i64 %inc, i64* %i, align 8, !dbg !108
  br label %for.cond, !dbg !109, !llvm.loop !110

for.end:                                          ; preds = %for.cond
  %6 = load i32*, i32** %data.addr, align 8, !dbg !112
  %arrayidx3 = getelementptr inbounds i32, i32* %6, i64 99, !dbg !112
  store i32 0, i32* %arrayidx3, align 4, !dbg !113
  %7 = load i32*, i32** %data.addr, align 8, !dbg !114
  call void @printWLine(i32* %7), !dbg !115
  %8 = load i32*, i32** %data.addr, align 8, !dbg !116
  %9 = bitcast i32* %8 to i8*, !dbg !116
  call void @free(i8* %9) #5, !dbg !117
  ret void, !dbg !118
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_41_good() #0 !dbg !119 {
entry:
  call void @goodG2B(), !dbg !120
  ret void, !dbg !121
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !122 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !128, metadata !DIExpression()), !dbg !129
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !130, metadata !DIExpression()), !dbg !131
  %call = call i64 @time(i64* null) #5, !dbg !132
  %conv = trunc i64 %call to i32, !dbg !133
  call void @srand(i32 %conv) #5, !dbg !134
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !135
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_41_good(), !dbg !136
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !137
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !138
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_41_bad(), !dbg !139
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !140
  ret i32 0, !dbg !141
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !142 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !143, metadata !DIExpression()), !dbg !144
  store i32* null, i32** %data, align 8, !dbg !145
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !146
  %0 = bitcast i8* %call to i32*, !dbg !147
  store i32* %0, i32** %data, align 8, !dbg !148
  %1 = load i32*, i32** %data, align 8, !dbg !149
  %cmp = icmp eq i32* %1, null, !dbg !151
  br i1 %cmp, label %if.then, label %if.end, !dbg !152

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !153
  unreachable, !dbg !153

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !155
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0, !dbg !155
  store i32 0, i32* %arrayidx, align 4, !dbg !156
  %3 = load i32*, i32** %data, align 8, !dbg !157
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_41_goodG2BSink(i32* %3), !dbg !158
  ret void, !dbg !159
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_41.c", directory: "/root/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_41_badSink", scope: !17, file: !17, line: 23, type: !18, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_41.c", directory: "/root/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null, !4}
!20 = !DILocalVariable(name: "data", arg: 1, scope: !16, file: !17, line: 23, type: !4)
!21 = !DILocation(line: 23, column: 84, scope: !16)
!22 = !DILocalVariable(name: "i", scope: !23, file: !17, line: 26, type: !24)
!23 = distinct !DILexicalBlock(scope: !16, file: !17, line: 25, column: 5)
!24 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !6, line: 46, baseType: !25)
!25 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!26 = !DILocation(line: 26, column: 16, scope: !23)
!27 = !DILocalVariable(name: "source", scope: !23, file: !17, line: 27, type: !28)
!28 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !29)
!29 = !{!30}
!30 = !DISubrange(count: 100)
!31 = !DILocation(line: 27, column: 17, scope: !23)
!32 = !DILocation(line: 28, column: 17, scope: !23)
!33 = !DILocation(line: 28, column: 9, scope: !23)
!34 = !DILocation(line: 29, column: 9, scope: !23)
!35 = !DILocation(line: 29, column: 23, scope: !23)
!36 = !DILocation(line: 31, column: 16, scope: !37)
!37 = distinct !DILexicalBlock(scope: !23, file: !17, line: 31, column: 9)
!38 = !DILocation(line: 31, column: 14, scope: !37)
!39 = !DILocation(line: 31, column: 21, scope: !40)
!40 = distinct !DILexicalBlock(scope: !37, file: !17, line: 31, column: 9)
!41 = !DILocation(line: 31, column: 23, scope: !40)
!42 = !DILocation(line: 31, column: 9, scope: !37)
!43 = !DILocation(line: 33, column: 30, scope: !44)
!44 = distinct !DILexicalBlock(scope: !40, file: !17, line: 32, column: 9)
!45 = !DILocation(line: 33, column: 23, scope: !44)
!46 = !DILocation(line: 33, column: 13, scope: !44)
!47 = !DILocation(line: 33, column: 18, scope: !44)
!48 = !DILocation(line: 33, column: 21, scope: !44)
!49 = !DILocation(line: 34, column: 9, scope: !44)
!50 = !DILocation(line: 31, column: 31, scope: !40)
!51 = !DILocation(line: 31, column: 9, scope: !40)
!52 = distinct !{!52, !42, !53, !54}
!53 = !DILocation(line: 34, column: 9, scope: !37)
!54 = !{!"llvm.loop.mustprogress"}
!55 = !DILocation(line: 35, column: 9, scope: !23)
!56 = !DILocation(line: 35, column: 21, scope: !23)
!57 = !DILocation(line: 36, column: 20, scope: !23)
!58 = !DILocation(line: 36, column: 9, scope: !23)
!59 = !DILocation(line: 37, column: 14, scope: !23)
!60 = !DILocation(line: 37, column: 9, scope: !23)
!61 = !DILocation(line: 39, column: 1, scope: !16)
!62 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_41_bad", scope: !17, file: !17, line: 41, type: !63, scopeLine: 42, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!63 = !DISubroutineType(types: !64)
!64 = !{null}
!65 = !DILocalVariable(name: "data", scope: !62, file: !17, line: 43, type: !4)
!66 = !DILocation(line: 43, column: 15, scope: !62)
!67 = !DILocation(line: 44, column: 10, scope: !62)
!68 = !DILocation(line: 46, column: 23, scope: !62)
!69 = !DILocation(line: 46, column: 12, scope: !62)
!70 = !DILocation(line: 46, column: 10, scope: !62)
!71 = !DILocation(line: 47, column: 9, scope: !72)
!72 = distinct !DILexicalBlock(scope: !62, file: !17, line: 47, column: 9)
!73 = !DILocation(line: 47, column: 14, scope: !72)
!74 = !DILocation(line: 47, column: 9, scope: !62)
!75 = !DILocation(line: 47, column: 24, scope: !76)
!76 = distinct !DILexicalBlock(scope: !72, file: !17, line: 47, column: 23)
!77 = !DILocation(line: 48, column: 5, scope: !62)
!78 = !DILocation(line: 48, column: 13, scope: !62)
!79 = !DILocation(line: 49, column: 73, scope: !62)
!80 = !DILocation(line: 49, column: 5, scope: !62)
!81 = !DILocation(line: 50, column: 1, scope: !62)
!82 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_41_goodG2BSink", scope: !17, file: !17, line: 56, type: !18, scopeLine: 57, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!83 = !DILocalVariable(name: "data", arg: 1, scope: !82, file: !17, line: 56, type: !4)
!84 = !DILocation(line: 56, column: 88, scope: !82)
!85 = !DILocalVariable(name: "i", scope: !86, file: !17, line: 59, type: !24)
!86 = distinct !DILexicalBlock(scope: !82, file: !17, line: 58, column: 5)
!87 = !DILocation(line: 59, column: 16, scope: !86)
!88 = !DILocalVariable(name: "source", scope: !86, file: !17, line: 60, type: !28)
!89 = !DILocation(line: 60, column: 17, scope: !86)
!90 = !DILocation(line: 61, column: 17, scope: !86)
!91 = !DILocation(line: 61, column: 9, scope: !86)
!92 = !DILocation(line: 62, column: 9, scope: !86)
!93 = !DILocation(line: 62, column: 23, scope: !86)
!94 = !DILocation(line: 64, column: 16, scope: !95)
!95 = distinct !DILexicalBlock(scope: !86, file: !17, line: 64, column: 9)
!96 = !DILocation(line: 64, column: 14, scope: !95)
!97 = !DILocation(line: 64, column: 21, scope: !98)
!98 = distinct !DILexicalBlock(scope: !95, file: !17, line: 64, column: 9)
!99 = !DILocation(line: 64, column: 23, scope: !98)
!100 = !DILocation(line: 64, column: 9, scope: !95)
!101 = !DILocation(line: 66, column: 30, scope: !102)
!102 = distinct !DILexicalBlock(scope: !98, file: !17, line: 65, column: 9)
!103 = !DILocation(line: 66, column: 23, scope: !102)
!104 = !DILocation(line: 66, column: 13, scope: !102)
!105 = !DILocation(line: 66, column: 18, scope: !102)
!106 = !DILocation(line: 66, column: 21, scope: !102)
!107 = !DILocation(line: 67, column: 9, scope: !102)
!108 = !DILocation(line: 64, column: 31, scope: !98)
!109 = !DILocation(line: 64, column: 9, scope: !98)
!110 = distinct !{!110, !100, !111, !54}
!111 = !DILocation(line: 67, column: 9, scope: !95)
!112 = !DILocation(line: 68, column: 9, scope: !86)
!113 = !DILocation(line: 68, column: 21, scope: !86)
!114 = !DILocation(line: 69, column: 20, scope: !86)
!115 = !DILocation(line: 69, column: 9, scope: !86)
!116 = !DILocation(line: 70, column: 14, scope: !86)
!117 = !DILocation(line: 70, column: 9, scope: !86)
!118 = !DILocation(line: 72, column: 1, scope: !82)
!119 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_41_good", scope: !17, file: !17, line: 86, type: !63, scopeLine: 87, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!120 = !DILocation(line: 88, column: 5, scope: !119)
!121 = !DILocation(line: 89, column: 1, scope: !119)
!122 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 101, type: !123, scopeLine: 102, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!123 = !DISubroutineType(types: !124)
!124 = !{!7, !7, !125}
!125 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !126, size: 64)
!126 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !127, size: 64)
!127 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!128 = !DILocalVariable(name: "argc", arg: 1, scope: !122, file: !17, line: 101, type: !7)
!129 = !DILocation(line: 101, column: 14, scope: !122)
!130 = !DILocalVariable(name: "argv", arg: 2, scope: !122, file: !17, line: 101, type: !125)
!131 = !DILocation(line: 101, column: 27, scope: !122)
!132 = !DILocation(line: 104, column: 22, scope: !122)
!133 = !DILocation(line: 104, column: 12, scope: !122)
!134 = !DILocation(line: 104, column: 5, scope: !122)
!135 = !DILocation(line: 106, column: 5, scope: !122)
!136 = !DILocation(line: 107, column: 5, scope: !122)
!137 = !DILocation(line: 108, column: 5, scope: !122)
!138 = !DILocation(line: 111, column: 5, scope: !122)
!139 = !DILocation(line: 112, column: 5, scope: !122)
!140 = !DILocation(line: 113, column: 5, scope: !122)
!141 = !DILocation(line: 115, column: 5, scope: !122)
!142 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 75, type: !63, scopeLine: 76, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!143 = !DILocalVariable(name: "data", scope: !142, file: !17, line: 77, type: !4)
!144 = !DILocation(line: 77, column: 15, scope: !142)
!145 = !DILocation(line: 78, column: 10, scope: !142)
!146 = !DILocation(line: 80, column: 23, scope: !142)
!147 = !DILocation(line: 80, column: 12, scope: !142)
!148 = !DILocation(line: 80, column: 10, scope: !142)
!149 = !DILocation(line: 81, column: 9, scope: !150)
!150 = distinct !DILexicalBlock(scope: !142, file: !17, line: 81, column: 9)
!151 = !DILocation(line: 81, column: 14, scope: !150)
!152 = !DILocation(line: 81, column: 9, scope: !142)
!153 = !DILocation(line: 81, column: 24, scope: !154)
!154 = distinct !DILexicalBlock(scope: !150, file: !17, line: 81, column: 23)
!155 = !DILocation(line: 82, column: 5, scope: !142)
!156 = !DILocation(line: 82, column: 13, scope: !142)
!157 = !DILocation(line: 83, column: 77, scope: !142)
!158 = !DILocation(line: 83, column: 5, scope: !142)
!159 = !DILocation(line: 84, column: 1, scope: !142)
