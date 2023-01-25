; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_31.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_31.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_31_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %dataCopy = alloca i32*, align 8
  %data1 = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  store i32* null, i32** %data, align 8, !dbg !22
  %call = call noalias align 16 i8* @malloc(i64 200) #5, !dbg !23
  %0 = bitcast i8* %call to i32*, !dbg !24
  store i32* %0, i32** %data, align 8, !dbg !25
  %1 = load i32*, i32** %data, align 8, !dbg !26
  %cmp = icmp eq i32* %1, null, !dbg !28
  br i1 %cmp, label %if.then, label %if.end, !dbg !29

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !30
  unreachable, !dbg !30

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !32
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0, !dbg !32
  store i32 0, i32* %arrayidx, align 4, !dbg !33
  call void @llvm.dbg.declare(metadata i32** %dataCopy, metadata !34, metadata !DIExpression()), !dbg !36
  %3 = load i32*, i32** %data, align 8, !dbg !37
  store i32* %3, i32** %dataCopy, align 8, !dbg !36
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !38, metadata !DIExpression()), !dbg !39
  %4 = load i32*, i32** %dataCopy, align 8, !dbg !40
  store i32* %4, i32** %data1, align 8, !dbg !39
  call void @llvm.dbg.declare(metadata i64* %i, metadata !41, metadata !DIExpression()), !dbg !45
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !46, metadata !DIExpression()), !dbg !50
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !51
  %call2 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !52
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !53
  store i32 0, i32* %arrayidx3, align 4, !dbg !54
  store i64 0, i64* %i, align 8, !dbg !55
  br label %for.cond, !dbg !57

for.cond:                                         ; preds = %for.inc, %if.end
  %5 = load i64, i64* %i, align 8, !dbg !58
  %cmp4 = icmp ult i64 %5, 100, !dbg !60
  br i1 %cmp4, label %for.body, label %for.end, !dbg !61

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %i, align 8, !dbg !62
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %6, !dbg !64
  %7 = load i32, i32* %arrayidx5, align 4, !dbg !64
  %8 = load i32*, i32** %data1, align 8, !dbg !65
  %9 = load i64, i64* %i, align 8, !dbg !66
  %arrayidx6 = getelementptr inbounds i32, i32* %8, i64 %9, !dbg !65
  store i32 %7, i32* %arrayidx6, align 4, !dbg !67
  br label %for.inc, !dbg !68

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !69
  %inc = add i64 %10, 1, !dbg !69
  store i64 %inc, i64* %i, align 8, !dbg !69
  br label %for.cond, !dbg !70, !llvm.loop !71

for.end:                                          ; preds = %for.cond
  %11 = load i32*, i32** %data1, align 8, !dbg !74
  %arrayidx7 = getelementptr inbounds i32, i32* %11, i64 99, !dbg !74
  store i32 0, i32* %arrayidx7, align 4, !dbg !75
  %12 = load i32*, i32** %data1, align 8, !dbg !76
  call void @printWLine(i32* %12), !dbg !77
  %13 = load i32*, i32** %data1, align 8, !dbg !78
  %14 = bitcast i32* %13 to i8*, !dbg !78
  call void @free(i8* %14) #5, !dbg !79
  ret void, !dbg !80
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_31_good() #0 !dbg !81 {
entry:
  call void @goodG2B(), !dbg !82
  ret void, !dbg !83
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !84 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !90, metadata !DIExpression()), !dbg !91
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !92, metadata !DIExpression()), !dbg !93
  %call = call i64 @time(i64* null) #5, !dbg !94
  %conv = trunc i64 %call to i32, !dbg !95
  call void @srand(i32 %conv) #5, !dbg !96
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !97
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_31_good(), !dbg !98
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !99
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !100
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_31_bad(), !dbg !101
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !102
  ret i32 0, !dbg !103
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !104 {
entry:
  %data = alloca i32*, align 8
  %dataCopy = alloca i32*, align 8
  %data1 = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !105, metadata !DIExpression()), !dbg !106
  store i32* null, i32** %data, align 8, !dbg !107
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !108
  %0 = bitcast i8* %call to i32*, !dbg !109
  store i32* %0, i32** %data, align 8, !dbg !110
  %1 = load i32*, i32** %data, align 8, !dbg !111
  %cmp = icmp eq i32* %1, null, !dbg !113
  br i1 %cmp, label %if.then, label %if.end, !dbg !114

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !115
  unreachable, !dbg !115

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !117
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0, !dbg !117
  store i32 0, i32* %arrayidx, align 4, !dbg !118
  call void @llvm.dbg.declare(metadata i32** %dataCopy, metadata !119, metadata !DIExpression()), !dbg !121
  %3 = load i32*, i32** %data, align 8, !dbg !122
  store i32* %3, i32** %dataCopy, align 8, !dbg !121
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !123, metadata !DIExpression()), !dbg !124
  %4 = load i32*, i32** %dataCopy, align 8, !dbg !125
  store i32* %4, i32** %data1, align 8, !dbg !124
  call void @llvm.dbg.declare(metadata i64* %i, metadata !126, metadata !DIExpression()), !dbg !128
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !129, metadata !DIExpression()), !dbg !130
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !131
  %call2 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !132
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !133
  store i32 0, i32* %arrayidx3, align 4, !dbg !134
  store i64 0, i64* %i, align 8, !dbg !135
  br label %for.cond, !dbg !137

for.cond:                                         ; preds = %for.inc, %if.end
  %5 = load i64, i64* %i, align 8, !dbg !138
  %cmp4 = icmp ult i64 %5, 100, !dbg !140
  br i1 %cmp4, label %for.body, label %for.end, !dbg !141

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %i, align 8, !dbg !142
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %6, !dbg !144
  %7 = load i32, i32* %arrayidx5, align 4, !dbg !144
  %8 = load i32*, i32** %data1, align 8, !dbg !145
  %9 = load i64, i64* %i, align 8, !dbg !146
  %arrayidx6 = getelementptr inbounds i32, i32* %8, i64 %9, !dbg !145
  store i32 %7, i32* %arrayidx6, align 4, !dbg !147
  br label %for.inc, !dbg !148

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !149
  %inc = add i64 %10, 1, !dbg !149
  store i64 %inc, i64* %i, align 8, !dbg !149
  br label %for.cond, !dbg !150, !llvm.loop !151

for.end:                                          ; preds = %for.cond
  %11 = load i32*, i32** %data1, align 8, !dbg !153
  %arrayidx7 = getelementptr inbounds i32, i32* %11, i64 99, !dbg !153
  store i32 0, i32* %arrayidx7, align 4, !dbg !154
  %12 = load i32*, i32** %data1, align 8, !dbg !155
  call void @printWLine(i32* %12), !dbg !156
  %13 = load i32*, i32** %data1, align 8, !dbg !157
  %14 = bitcast i32* %13 to i8*, !dbg !157
  call void @free(i8* %14) #5, !dbg !158
  ret void, !dbg !159
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_31.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !8, !9}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !6, line: 74, baseType: !7)
!6 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"clang version 13.0.0"}
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_31_bad", scope: !17, file: !17, line: 23, type: !18, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_31.c", directory: "/home/joelyang/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 25, type: !4)
!21 = !DILocation(line: 25, column: 15, scope: !16)
!22 = !DILocation(line: 26, column: 10, scope: !16)
!23 = !DILocation(line: 28, column: 23, scope: !16)
!24 = !DILocation(line: 28, column: 12, scope: !16)
!25 = !DILocation(line: 28, column: 10, scope: !16)
!26 = !DILocation(line: 29, column: 9, scope: !27)
!27 = distinct !DILexicalBlock(scope: !16, file: !17, line: 29, column: 9)
!28 = !DILocation(line: 29, column: 14, scope: !27)
!29 = !DILocation(line: 29, column: 9, scope: !16)
!30 = !DILocation(line: 29, column: 24, scope: !31)
!31 = distinct !DILexicalBlock(scope: !27, file: !17, line: 29, column: 23)
!32 = !DILocation(line: 30, column: 5, scope: !16)
!33 = !DILocation(line: 30, column: 13, scope: !16)
!34 = !DILocalVariable(name: "dataCopy", scope: !35, file: !17, line: 32, type: !4)
!35 = distinct !DILexicalBlock(scope: !16, file: !17, line: 31, column: 5)
!36 = !DILocation(line: 32, column: 19, scope: !35)
!37 = !DILocation(line: 32, column: 30, scope: !35)
!38 = !DILocalVariable(name: "data", scope: !35, file: !17, line: 33, type: !4)
!39 = !DILocation(line: 33, column: 19, scope: !35)
!40 = !DILocation(line: 33, column: 26, scope: !35)
!41 = !DILocalVariable(name: "i", scope: !42, file: !17, line: 35, type: !43)
!42 = distinct !DILexicalBlock(scope: !35, file: !17, line: 34, column: 9)
!43 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !6, line: 46, baseType: !44)
!44 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!45 = !DILocation(line: 35, column: 20, scope: !42)
!46 = !DILocalVariable(name: "source", scope: !42, file: !17, line: 36, type: !47)
!47 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !48)
!48 = !{!49}
!49 = !DISubrange(count: 100)
!50 = !DILocation(line: 36, column: 21, scope: !42)
!51 = !DILocation(line: 37, column: 21, scope: !42)
!52 = !DILocation(line: 37, column: 13, scope: !42)
!53 = !DILocation(line: 38, column: 13, scope: !42)
!54 = !DILocation(line: 38, column: 27, scope: !42)
!55 = !DILocation(line: 40, column: 20, scope: !56)
!56 = distinct !DILexicalBlock(scope: !42, file: !17, line: 40, column: 13)
!57 = !DILocation(line: 40, column: 18, scope: !56)
!58 = !DILocation(line: 40, column: 25, scope: !59)
!59 = distinct !DILexicalBlock(scope: !56, file: !17, line: 40, column: 13)
!60 = !DILocation(line: 40, column: 27, scope: !59)
!61 = !DILocation(line: 40, column: 13, scope: !56)
!62 = !DILocation(line: 42, column: 34, scope: !63)
!63 = distinct !DILexicalBlock(scope: !59, file: !17, line: 41, column: 13)
!64 = !DILocation(line: 42, column: 27, scope: !63)
!65 = !DILocation(line: 42, column: 17, scope: !63)
!66 = !DILocation(line: 42, column: 22, scope: !63)
!67 = !DILocation(line: 42, column: 25, scope: !63)
!68 = !DILocation(line: 43, column: 13, scope: !63)
!69 = !DILocation(line: 40, column: 35, scope: !59)
!70 = !DILocation(line: 40, column: 13, scope: !59)
!71 = distinct !{!71, !61, !72, !73}
!72 = !DILocation(line: 43, column: 13, scope: !56)
!73 = !{!"llvm.loop.mustprogress"}
!74 = !DILocation(line: 44, column: 13, scope: !42)
!75 = !DILocation(line: 44, column: 25, scope: !42)
!76 = !DILocation(line: 45, column: 24, scope: !42)
!77 = !DILocation(line: 45, column: 13, scope: !42)
!78 = !DILocation(line: 46, column: 18, scope: !42)
!79 = !DILocation(line: 46, column: 13, scope: !42)
!80 = !DILocation(line: 49, column: 1, scope: !16)
!81 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_31_good", scope: !17, file: !17, line: 84, type: !18, scopeLine: 85, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!82 = !DILocation(line: 86, column: 5, scope: !81)
!83 = !DILocation(line: 87, column: 1, scope: !81)
!84 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 98, type: !85, scopeLine: 99, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!85 = !DISubroutineType(types: !86)
!86 = !{!7, !7, !87}
!87 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !88, size: 64)
!88 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !89, size: 64)
!89 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!90 = !DILocalVariable(name: "argc", arg: 1, scope: !84, file: !17, line: 98, type: !7)
!91 = !DILocation(line: 98, column: 14, scope: !84)
!92 = !DILocalVariable(name: "argv", arg: 2, scope: !84, file: !17, line: 98, type: !87)
!93 = !DILocation(line: 98, column: 27, scope: !84)
!94 = !DILocation(line: 101, column: 22, scope: !84)
!95 = !DILocation(line: 101, column: 12, scope: !84)
!96 = !DILocation(line: 101, column: 5, scope: !84)
!97 = !DILocation(line: 103, column: 5, scope: !84)
!98 = !DILocation(line: 104, column: 5, scope: !84)
!99 = !DILocation(line: 105, column: 5, scope: !84)
!100 = !DILocation(line: 108, column: 5, scope: !84)
!101 = !DILocation(line: 109, column: 5, scope: !84)
!102 = !DILocation(line: 110, column: 5, scope: !84)
!103 = !DILocation(line: 112, column: 5, scope: !84)
!104 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 56, type: !18, scopeLine: 57, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!105 = !DILocalVariable(name: "data", scope: !104, file: !17, line: 58, type: !4)
!106 = !DILocation(line: 58, column: 15, scope: !104)
!107 = !DILocation(line: 59, column: 10, scope: !104)
!108 = !DILocation(line: 61, column: 23, scope: !104)
!109 = !DILocation(line: 61, column: 12, scope: !104)
!110 = !DILocation(line: 61, column: 10, scope: !104)
!111 = !DILocation(line: 62, column: 9, scope: !112)
!112 = distinct !DILexicalBlock(scope: !104, file: !17, line: 62, column: 9)
!113 = !DILocation(line: 62, column: 14, scope: !112)
!114 = !DILocation(line: 62, column: 9, scope: !104)
!115 = !DILocation(line: 62, column: 24, scope: !116)
!116 = distinct !DILexicalBlock(scope: !112, file: !17, line: 62, column: 23)
!117 = !DILocation(line: 63, column: 5, scope: !104)
!118 = !DILocation(line: 63, column: 13, scope: !104)
!119 = !DILocalVariable(name: "dataCopy", scope: !120, file: !17, line: 65, type: !4)
!120 = distinct !DILexicalBlock(scope: !104, file: !17, line: 64, column: 5)
!121 = !DILocation(line: 65, column: 19, scope: !120)
!122 = !DILocation(line: 65, column: 30, scope: !120)
!123 = !DILocalVariable(name: "data", scope: !120, file: !17, line: 66, type: !4)
!124 = !DILocation(line: 66, column: 19, scope: !120)
!125 = !DILocation(line: 66, column: 26, scope: !120)
!126 = !DILocalVariable(name: "i", scope: !127, file: !17, line: 68, type: !43)
!127 = distinct !DILexicalBlock(scope: !120, file: !17, line: 67, column: 9)
!128 = !DILocation(line: 68, column: 20, scope: !127)
!129 = !DILocalVariable(name: "source", scope: !127, file: !17, line: 69, type: !47)
!130 = !DILocation(line: 69, column: 21, scope: !127)
!131 = !DILocation(line: 70, column: 21, scope: !127)
!132 = !DILocation(line: 70, column: 13, scope: !127)
!133 = !DILocation(line: 71, column: 13, scope: !127)
!134 = !DILocation(line: 71, column: 27, scope: !127)
!135 = !DILocation(line: 73, column: 20, scope: !136)
!136 = distinct !DILexicalBlock(scope: !127, file: !17, line: 73, column: 13)
!137 = !DILocation(line: 73, column: 18, scope: !136)
!138 = !DILocation(line: 73, column: 25, scope: !139)
!139 = distinct !DILexicalBlock(scope: !136, file: !17, line: 73, column: 13)
!140 = !DILocation(line: 73, column: 27, scope: !139)
!141 = !DILocation(line: 73, column: 13, scope: !136)
!142 = !DILocation(line: 75, column: 34, scope: !143)
!143 = distinct !DILexicalBlock(scope: !139, file: !17, line: 74, column: 13)
!144 = !DILocation(line: 75, column: 27, scope: !143)
!145 = !DILocation(line: 75, column: 17, scope: !143)
!146 = !DILocation(line: 75, column: 22, scope: !143)
!147 = !DILocation(line: 75, column: 25, scope: !143)
!148 = !DILocation(line: 76, column: 13, scope: !143)
!149 = !DILocation(line: 73, column: 35, scope: !139)
!150 = !DILocation(line: 73, column: 13, scope: !139)
!151 = distinct !{!151, !141, !152, !73}
!152 = !DILocation(line: 76, column: 13, scope: !136)
!153 = !DILocation(line: 77, column: 13, scope: !127)
!154 = !DILocation(line: 77, column: 25, scope: !127)
!155 = !DILocation(line: 78, column: 24, scope: !127)
!156 = !DILocation(line: 78, column: 13, scope: !127)
!157 = !DILocation(line: 79, column: 18, scope: !127)
!158 = !DILocation(line: 79, column: 13, scope: !127)
!159 = !DILocation(line: 82, column: 1, scope: !104)
