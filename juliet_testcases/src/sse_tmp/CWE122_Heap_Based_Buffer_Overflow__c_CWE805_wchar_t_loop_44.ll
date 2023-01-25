; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_44.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_44.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_44_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %funcPtr = alloca void (i32*)*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata void (i32*)** %funcPtr, metadata !22, metadata !DIExpression()), !dbg !26
  store void (i32*)* @badSink, void (i32*)** %funcPtr, align 8, !dbg !26
  store i32* null, i32** %data, align 8, !dbg !27
  %call = call noalias align 16 i8* @malloc(i64 200) #5, !dbg !28
  %0 = bitcast i8* %call to i32*, !dbg !29
  store i32* %0, i32** %data, align 8, !dbg !30
  %1 = load i32*, i32** %data, align 8, !dbg !31
  %cmp = icmp eq i32* %1, null, !dbg !33
  br i1 %cmp, label %if.then, label %if.end, !dbg !34

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !35
  unreachable, !dbg !35

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !37
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0, !dbg !37
  store i32 0, i32* %arrayidx, align 4, !dbg !38
  %3 = load void (i32*)*, void (i32*)** %funcPtr, align 8, !dbg !39
  %4 = load i32*, i32** %data, align 8, !dbg !40
  call void %3(i32* %4), !dbg !39
  ret void, !dbg !41
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal void @badSink(i32* %data) #0 !dbg !42 {
entry:
  %data.addr = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !43, metadata !DIExpression()), !dbg !44
  call void @llvm.dbg.declare(metadata i64* %i, metadata !45, metadata !DIExpression()), !dbg !49
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !50, metadata !DIExpression()), !dbg !54
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !55
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !56
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !57
  store i32 0, i32* %arrayidx, align 4, !dbg !58
  store i64 0, i64* %i, align 8, !dbg !59
  br label %for.cond, !dbg !61

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !62
  %cmp = icmp ult i64 %0, 100, !dbg !64
  br i1 %cmp, label %for.body, label %for.end, !dbg !65

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !66
  %arrayidx1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %1, !dbg !68
  %2 = load i32, i32* %arrayidx1, align 4, !dbg !68
  %3 = load i32*, i32** %data.addr, align 8, !dbg !69
  %4 = load i64, i64* %i, align 8, !dbg !70
  %arrayidx2 = getelementptr inbounds i32, i32* %3, i64 %4, !dbg !69
  store i32 %2, i32* %arrayidx2, align 4, !dbg !71
  br label %for.inc, !dbg !72

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !73
  %inc = add i64 %5, 1, !dbg !73
  store i64 %inc, i64* %i, align 8, !dbg !73
  br label %for.cond, !dbg !74, !llvm.loop !75

for.end:                                          ; preds = %for.cond
  %6 = load i32*, i32** %data.addr, align 8, !dbg !78
  %arrayidx3 = getelementptr inbounds i32, i32* %6, i64 99, !dbg !78
  store i32 0, i32* %arrayidx3, align 4, !dbg !79
  %7 = load i32*, i32** %data.addr, align 8, !dbg !80
  call void @printWLine(i32* %7), !dbg !81
  %8 = load i32*, i32** %data.addr, align 8, !dbg !82
  %9 = bitcast i32* %8 to i8*, !dbg !82
  call void @free(i8* %9) #5, !dbg !83
  ret void, !dbg !84
}

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_44_good() #0 !dbg !85 {
entry:
  call void @goodG2B(), !dbg !86
  ret void, !dbg !87
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !88 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !94, metadata !DIExpression()), !dbg !95
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !96, metadata !DIExpression()), !dbg !97
  %call = call i64 @time(i64* null) #5, !dbg !98
  %conv = trunc i64 %call to i32, !dbg !99
  call void @srand(i32 %conv) #5, !dbg !100
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !101
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_44_good(), !dbg !102
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !103
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !104
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_44_bad(), !dbg !105
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !106
  ret i32 0, !dbg !107
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

declare dso_local void @printWLine(i32*) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !108 {
entry:
  %data = alloca i32*, align 8
  %funcPtr = alloca void (i32*)*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !109, metadata !DIExpression()), !dbg !110
  call void @llvm.dbg.declare(metadata void (i32*)** %funcPtr, metadata !111, metadata !DIExpression()), !dbg !112
  store void (i32*)* @goodG2BSink, void (i32*)** %funcPtr, align 8, !dbg !112
  store i32* null, i32** %data, align 8, !dbg !113
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !114
  %0 = bitcast i8* %call to i32*, !dbg !115
  store i32* %0, i32** %data, align 8, !dbg !116
  %1 = load i32*, i32** %data, align 8, !dbg !117
  %cmp = icmp eq i32* %1, null, !dbg !119
  br i1 %cmp, label %if.then, label %if.end, !dbg !120

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !121
  unreachable, !dbg !121

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !123
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0, !dbg !123
  store i32 0, i32* %arrayidx, align 4, !dbg !124
  %3 = load void (i32*)*, void (i32*)** %funcPtr, align 8, !dbg !125
  %4 = load i32*, i32** %data, align 8, !dbg !126
  call void %3(i32* %4), !dbg !125
  ret void, !dbg !127
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink(i32* %data) #0 !dbg !128 {
entry:
  %data.addr = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !129, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.declare(metadata i64* %i, metadata !131, metadata !DIExpression()), !dbg !133
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !134, metadata !DIExpression()), !dbg !135
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !136
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !137
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !138
  store i32 0, i32* %arrayidx, align 4, !dbg !139
  store i64 0, i64* %i, align 8, !dbg !140
  br label %for.cond, !dbg !142

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !143
  %cmp = icmp ult i64 %0, 100, !dbg !145
  br i1 %cmp, label %for.body, label %for.end, !dbg !146

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !147
  %arrayidx1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %1, !dbg !149
  %2 = load i32, i32* %arrayidx1, align 4, !dbg !149
  %3 = load i32*, i32** %data.addr, align 8, !dbg !150
  %4 = load i64, i64* %i, align 8, !dbg !151
  %arrayidx2 = getelementptr inbounds i32, i32* %3, i64 %4, !dbg !150
  store i32 %2, i32* %arrayidx2, align 4, !dbg !152
  br label %for.inc, !dbg !153

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !154
  %inc = add i64 %5, 1, !dbg !154
  store i64 %inc, i64* %i, align 8, !dbg !154
  br label %for.cond, !dbg !155, !llvm.loop !156

for.end:                                          ; preds = %for.cond
  %6 = load i32*, i32** %data.addr, align 8, !dbg !158
  %arrayidx3 = getelementptr inbounds i32, i32* %6, i64 99, !dbg !158
  store i32 0, i32* %arrayidx3, align 4, !dbg !159
  %7 = load i32*, i32** %data.addr, align 8, !dbg !160
  call void @printWLine(i32* %7), !dbg !161
  %8 = load i32*, i32** %data.addr, align 8, !dbg !162
  %9 = bitcast i32* %8 to i8*, !dbg !162
  call void @free(i8* %9) #5, !dbg !163
  ret void, !dbg !164
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_44.c", directory: "/home/joelyang/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_44_bad", scope: !17, file: !17, line: 41, type: !18, scopeLine: 42, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_44.c", directory: "/home/joelyang/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 43, type: !4)
!21 = !DILocation(line: 43, column: 15, scope: !16)
!22 = !DILocalVariable(name: "funcPtr", scope: !16, file: !17, line: 45, type: !23)
!23 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !24, size: 64)
!24 = !DISubroutineType(types: !25)
!25 = !{null, !4}
!26 = !DILocation(line: 45, column: 12, scope: !16)
!27 = !DILocation(line: 46, column: 10, scope: !16)
!28 = !DILocation(line: 48, column: 23, scope: !16)
!29 = !DILocation(line: 48, column: 12, scope: !16)
!30 = !DILocation(line: 48, column: 10, scope: !16)
!31 = !DILocation(line: 49, column: 9, scope: !32)
!32 = distinct !DILexicalBlock(scope: !16, file: !17, line: 49, column: 9)
!33 = !DILocation(line: 49, column: 14, scope: !32)
!34 = !DILocation(line: 49, column: 9, scope: !16)
!35 = !DILocation(line: 49, column: 24, scope: !36)
!36 = distinct !DILexicalBlock(scope: !32, file: !17, line: 49, column: 23)
!37 = !DILocation(line: 50, column: 5, scope: !16)
!38 = !DILocation(line: 50, column: 13, scope: !16)
!39 = !DILocation(line: 52, column: 5, scope: !16)
!40 = !DILocation(line: 52, column: 13, scope: !16)
!41 = !DILocation(line: 53, column: 1, scope: !16)
!42 = distinct !DISubprogram(name: "badSink", scope: !17, file: !17, line: 23, type: !24, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!43 = !DILocalVariable(name: "data", arg: 1, scope: !42, file: !17, line: 23, type: !4)
!44 = !DILocation(line: 23, column: 31, scope: !42)
!45 = !DILocalVariable(name: "i", scope: !46, file: !17, line: 26, type: !47)
!46 = distinct !DILexicalBlock(scope: !42, file: !17, line: 25, column: 5)
!47 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !6, line: 46, baseType: !48)
!48 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!49 = !DILocation(line: 26, column: 16, scope: !46)
!50 = !DILocalVariable(name: "source", scope: !46, file: !17, line: 27, type: !51)
!51 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !52)
!52 = !{!53}
!53 = !DISubrange(count: 100)
!54 = !DILocation(line: 27, column: 17, scope: !46)
!55 = !DILocation(line: 28, column: 17, scope: !46)
!56 = !DILocation(line: 28, column: 9, scope: !46)
!57 = !DILocation(line: 29, column: 9, scope: !46)
!58 = !DILocation(line: 29, column: 23, scope: !46)
!59 = !DILocation(line: 31, column: 16, scope: !60)
!60 = distinct !DILexicalBlock(scope: !46, file: !17, line: 31, column: 9)
!61 = !DILocation(line: 31, column: 14, scope: !60)
!62 = !DILocation(line: 31, column: 21, scope: !63)
!63 = distinct !DILexicalBlock(scope: !60, file: !17, line: 31, column: 9)
!64 = !DILocation(line: 31, column: 23, scope: !63)
!65 = !DILocation(line: 31, column: 9, scope: !60)
!66 = !DILocation(line: 33, column: 30, scope: !67)
!67 = distinct !DILexicalBlock(scope: !63, file: !17, line: 32, column: 9)
!68 = !DILocation(line: 33, column: 23, scope: !67)
!69 = !DILocation(line: 33, column: 13, scope: !67)
!70 = !DILocation(line: 33, column: 18, scope: !67)
!71 = !DILocation(line: 33, column: 21, scope: !67)
!72 = !DILocation(line: 34, column: 9, scope: !67)
!73 = !DILocation(line: 31, column: 31, scope: !63)
!74 = !DILocation(line: 31, column: 9, scope: !63)
!75 = distinct !{!75, !65, !76, !77}
!76 = !DILocation(line: 34, column: 9, scope: !60)
!77 = !{!"llvm.loop.mustprogress"}
!78 = !DILocation(line: 35, column: 9, scope: !46)
!79 = !DILocation(line: 35, column: 21, scope: !46)
!80 = !DILocation(line: 36, column: 20, scope: !46)
!81 = !DILocation(line: 36, column: 9, scope: !46)
!82 = !DILocation(line: 37, column: 14, scope: !46)
!83 = !DILocation(line: 37, column: 9, scope: !46)
!84 = !DILocation(line: 39, column: 1, scope: !42)
!85 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_44_good", scope: !17, file: !17, line: 90, type: !18, scopeLine: 91, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!86 = !DILocation(line: 92, column: 5, scope: !85)
!87 = !DILocation(line: 93, column: 1, scope: !85)
!88 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 104, type: !89, scopeLine: 105, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!89 = !DISubroutineType(types: !90)
!90 = !{!7, !7, !91}
!91 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !92, size: 64)
!92 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !93, size: 64)
!93 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!94 = !DILocalVariable(name: "argc", arg: 1, scope: !88, file: !17, line: 104, type: !7)
!95 = !DILocation(line: 104, column: 14, scope: !88)
!96 = !DILocalVariable(name: "argv", arg: 2, scope: !88, file: !17, line: 104, type: !91)
!97 = !DILocation(line: 104, column: 27, scope: !88)
!98 = !DILocation(line: 107, column: 22, scope: !88)
!99 = !DILocation(line: 107, column: 12, scope: !88)
!100 = !DILocation(line: 107, column: 5, scope: !88)
!101 = !DILocation(line: 109, column: 5, scope: !88)
!102 = !DILocation(line: 110, column: 5, scope: !88)
!103 = !DILocation(line: 111, column: 5, scope: !88)
!104 = !DILocation(line: 114, column: 5, scope: !88)
!105 = !DILocation(line: 115, column: 5, scope: !88)
!106 = !DILocation(line: 116, column: 5, scope: !88)
!107 = !DILocation(line: 118, column: 5, scope: !88)
!108 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 78, type: !18, scopeLine: 79, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!109 = !DILocalVariable(name: "data", scope: !108, file: !17, line: 80, type: !4)
!110 = !DILocation(line: 80, column: 15, scope: !108)
!111 = !DILocalVariable(name: "funcPtr", scope: !108, file: !17, line: 81, type: !23)
!112 = !DILocation(line: 81, column: 12, scope: !108)
!113 = !DILocation(line: 82, column: 10, scope: !108)
!114 = !DILocation(line: 84, column: 23, scope: !108)
!115 = !DILocation(line: 84, column: 12, scope: !108)
!116 = !DILocation(line: 84, column: 10, scope: !108)
!117 = !DILocation(line: 85, column: 9, scope: !118)
!118 = distinct !DILexicalBlock(scope: !108, file: !17, line: 85, column: 9)
!119 = !DILocation(line: 85, column: 14, scope: !118)
!120 = !DILocation(line: 85, column: 9, scope: !108)
!121 = !DILocation(line: 85, column: 24, scope: !122)
!122 = distinct !DILexicalBlock(scope: !118, file: !17, line: 85, column: 23)
!123 = !DILocation(line: 86, column: 5, scope: !108)
!124 = !DILocation(line: 86, column: 13, scope: !108)
!125 = !DILocation(line: 87, column: 5, scope: !108)
!126 = !DILocation(line: 87, column: 13, scope: !108)
!127 = !DILocation(line: 88, column: 1, scope: !108)
!128 = distinct !DISubprogram(name: "goodG2BSink", scope: !17, file: !17, line: 60, type: !24, scopeLine: 61, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!129 = !DILocalVariable(name: "data", arg: 1, scope: !128, file: !17, line: 60, type: !4)
!130 = !DILocation(line: 60, column: 35, scope: !128)
!131 = !DILocalVariable(name: "i", scope: !132, file: !17, line: 63, type: !47)
!132 = distinct !DILexicalBlock(scope: !128, file: !17, line: 62, column: 5)
!133 = !DILocation(line: 63, column: 16, scope: !132)
!134 = !DILocalVariable(name: "source", scope: !132, file: !17, line: 64, type: !51)
!135 = !DILocation(line: 64, column: 17, scope: !132)
!136 = !DILocation(line: 65, column: 17, scope: !132)
!137 = !DILocation(line: 65, column: 9, scope: !132)
!138 = !DILocation(line: 66, column: 9, scope: !132)
!139 = !DILocation(line: 66, column: 23, scope: !132)
!140 = !DILocation(line: 68, column: 16, scope: !141)
!141 = distinct !DILexicalBlock(scope: !132, file: !17, line: 68, column: 9)
!142 = !DILocation(line: 68, column: 14, scope: !141)
!143 = !DILocation(line: 68, column: 21, scope: !144)
!144 = distinct !DILexicalBlock(scope: !141, file: !17, line: 68, column: 9)
!145 = !DILocation(line: 68, column: 23, scope: !144)
!146 = !DILocation(line: 68, column: 9, scope: !141)
!147 = !DILocation(line: 70, column: 30, scope: !148)
!148 = distinct !DILexicalBlock(scope: !144, file: !17, line: 69, column: 9)
!149 = !DILocation(line: 70, column: 23, scope: !148)
!150 = !DILocation(line: 70, column: 13, scope: !148)
!151 = !DILocation(line: 70, column: 18, scope: !148)
!152 = !DILocation(line: 70, column: 21, scope: !148)
!153 = !DILocation(line: 71, column: 9, scope: !148)
!154 = !DILocation(line: 68, column: 31, scope: !144)
!155 = !DILocation(line: 68, column: 9, scope: !144)
!156 = distinct !{!156, !146, !157, !77}
!157 = !DILocation(line: 71, column: 9, scope: !141)
!158 = !DILocation(line: 72, column: 9, scope: !132)
!159 = !DILocation(line: 72, column: 21, scope: !132)
!160 = !DILocation(line: 73, column: 20, scope: !132)
!161 = !DILocation(line: 73, column: 9, scope: !132)
!162 = !DILocation(line: 74, column: 14, scope: !132)
!163 = !DILocation(line: 74, column: 9, scope: !132)
!164 = !DILocation(line: 76, column: 1, scope: !128)
