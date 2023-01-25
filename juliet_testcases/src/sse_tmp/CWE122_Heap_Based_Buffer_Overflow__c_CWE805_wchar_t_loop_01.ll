; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_01.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_01.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_01_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
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
  call void @llvm.dbg.declare(metadata i64* %i, metadata !34, metadata !DIExpression()), !dbg !38
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !39, metadata !DIExpression()), !dbg !43
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !44
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !45
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !46
  store i32 0, i32* %arrayidx2, align 4, !dbg !47
  store i64 0, i64* %i, align 8, !dbg !48
  br label %for.cond, !dbg !50

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !51
  %cmp3 = icmp ult i64 %3, 100, !dbg !53
  br i1 %cmp3, label %for.body, label %for.end, !dbg !54

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !55
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %4, !dbg !57
  %5 = load i32, i32* %arrayidx4, align 4, !dbg !57
  %6 = load i32*, i32** %data, align 8, !dbg !58
  %7 = load i64, i64* %i, align 8, !dbg !59
  %arrayidx5 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !58
  store i32 %5, i32* %arrayidx5, align 4, !dbg !60
  br label %for.inc, !dbg !61

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !62
  %inc = add i64 %8, 1, !dbg !62
  store i64 %inc, i64* %i, align 8, !dbg !62
  br label %for.cond, !dbg !63, !llvm.loop !64

for.end:                                          ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !67
  %arrayidx6 = getelementptr inbounds i32, i32* %9, i64 99, !dbg !67
  store i32 0, i32* %arrayidx6, align 4, !dbg !68
  %10 = load i32*, i32** %data, align 8, !dbg !69
  call void @printWLine(i32* %10), !dbg !70
  %11 = load i32*, i32** %data, align 8, !dbg !71
  %12 = bitcast i32* %11 to i8*, !dbg !71
  call void @free(i8* %12) #5, !dbg !72
  ret void, !dbg !73
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_01_good() #0 !dbg !74 {
entry:
  call void @goodG2B(), !dbg !75
  ret void, !dbg !76
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !77 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !83, metadata !DIExpression()), !dbg !84
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !85, metadata !DIExpression()), !dbg !86
  %call = call i64 @time(i64* null) #5, !dbg !87
  %conv = trunc i64 %call to i32, !dbg !88
  call void @srand(i32 %conv) #5, !dbg !89
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !90
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_01_good(), !dbg !91
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !92
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !93
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_01_bad(), !dbg !94
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !95
  ret i32 0, !dbg !96
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !97 {
entry:
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !98, metadata !DIExpression()), !dbg !99
  store i32* null, i32** %data, align 8, !dbg !100
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !101
  %0 = bitcast i8* %call to i32*, !dbg !102
  store i32* %0, i32** %data, align 8, !dbg !103
  %1 = load i32*, i32** %data, align 8, !dbg !104
  %cmp = icmp eq i32* %1, null, !dbg !106
  br i1 %cmp, label %if.then, label %if.end, !dbg !107

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !108
  unreachable, !dbg !108

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !110
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0, !dbg !110
  store i32 0, i32* %arrayidx, align 4, !dbg !111
  call void @llvm.dbg.declare(metadata i64* %i, metadata !112, metadata !DIExpression()), !dbg !114
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !115, metadata !DIExpression()), !dbg !116
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !117
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !118
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !119
  store i32 0, i32* %arrayidx2, align 4, !dbg !120
  store i64 0, i64* %i, align 8, !dbg !121
  br label %for.cond, !dbg !123

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !124
  %cmp3 = icmp ult i64 %3, 100, !dbg !126
  br i1 %cmp3, label %for.body, label %for.end, !dbg !127

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !128
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %4, !dbg !130
  %5 = load i32, i32* %arrayidx4, align 4, !dbg !130
  %6 = load i32*, i32** %data, align 8, !dbg !131
  %7 = load i64, i64* %i, align 8, !dbg !132
  %arrayidx5 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !131
  store i32 %5, i32* %arrayidx5, align 4, !dbg !133
  br label %for.inc, !dbg !134

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !135
  %inc = add i64 %8, 1, !dbg !135
  store i64 %inc, i64* %i, align 8, !dbg !135
  br label %for.cond, !dbg !136, !llvm.loop !137

for.end:                                          ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !139
  %arrayidx6 = getelementptr inbounds i32, i32* %9, i64 99, !dbg !139
  store i32 0, i32* %arrayidx6, align 4, !dbg !140
  %10 = load i32*, i32** %data, align 8, !dbg !141
  call void @printWLine(i32* %10), !dbg !142
  %11 = load i32*, i32** %data, align 8, !dbg !143
  %12 = bitcast i32* %11 to i8*, !dbg !143
  call void @free(i8* %12) #5, !dbg !144
  ret void, !dbg !145
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_01.c", directory: "/home/joelyang/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_01_bad", scope: !17, file: !17, line: 23, type: !18, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_01.c", directory: "/home/joelyang/SSE-Assessment")
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
!34 = !DILocalVariable(name: "i", scope: !35, file: !17, line: 32, type: !36)
!35 = distinct !DILexicalBlock(scope: !16, file: !17, line: 31, column: 5)
!36 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !6, line: 46, baseType: !37)
!37 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!38 = !DILocation(line: 32, column: 16, scope: !35)
!39 = !DILocalVariable(name: "source", scope: !35, file: !17, line: 33, type: !40)
!40 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !41)
!41 = !{!42}
!42 = !DISubrange(count: 100)
!43 = !DILocation(line: 33, column: 17, scope: !35)
!44 = !DILocation(line: 34, column: 17, scope: !35)
!45 = !DILocation(line: 34, column: 9, scope: !35)
!46 = !DILocation(line: 35, column: 9, scope: !35)
!47 = !DILocation(line: 35, column: 23, scope: !35)
!48 = !DILocation(line: 37, column: 16, scope: !49)
!49 = distinct !DILexicalBlock(scope: !35, file: !17, line: 37, column: 9)
!50 = !DILocation(line: 37, column: 14, scope: !49)
!51 = !DILocation(line: 37, column: 21, scope: !52)
!52 = distinct !DILexicalBlock(scope: !49, file: !17, line: 37, column: 9)
!53 = !DILocation(line: 37, column: 23, scope: !52)
!54 = !DILocation(line: 37, column: 9, scope: !49)
!55 = !DILocation(line: 39, column: 30, scope: !56)
!56 = distinct !DILexicalBlock(scope: !52, file: !17, line: 38, column: 9)
!57 = !DILocation(line: 39, column: 23, scope: !56)
!58 = !DILocation(line: 39, column: 13, scope: !56)
!59 = !DILocation(line: 39, column: 18, scope: !56)
!60 = !DILocation(line: 39, column: 21, scope: !56)
!61 = !DILocation(line: 40, column: 9, scope: !56)
!62 = !DILocation(line: 37, column: 31, scope: !52)
!63 = !DILocation(line: 37, column: 9, scope: !52)
!64 = distinct !{!64, !54, !65, !66}
!65 = !DILocation(line: 40, column: 9, scope: !49)
!66 = !{!"llvm.loop.mustprogress"}
!67 = !DILocation(line: 41, column: 9, scope: !35)
!68 = !DILocation(line: 41, column: 21, scope: !35)
!69 = !DILocation(line: 42, column: 20, scope: !35)
!70 = !DILocation(line: 42, column: 9, scope: !35)
!71 = !DILocation(line: 43, column: 14, scope: !35)
!72 = !DILocation(line: 43, column: 9, scope: !35)
!73 = !DILocation(line: 45, column: 1, scope: !16)
!74 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_01_good", scope: !17, file: !17, line: 76, type: !18, scopeLine: 77, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!75 = !DILocation(line: 78, column: 5, scope: !74)
!76 = !DILocation(line: 79, column: 1, scope: !74)
!77 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 91, type: !78, scopeLine: 92, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!78 = !DISubroutineType(types: !79)
!79 = !{!7, !7, !80}
!80 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !81, size: 64)
!81 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !82, size: 64)
!82 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!83 = !DILocalVariable(name: "argc", arg: 1, scope: !77, file: !17, line: 91, type: !7)
!84 = !DILocation(line: 91, column: 14, scope: !77)
!85 = !DILocalVariable(name: "argv", arg: 2, scope: !77, file: !17, line: 91, type: !80)
!86 = !DILocation(line: 91, column: 27, scope: !77)
!87 = !DILocation(line: 94, column: 22, scope: !77)
!88 = !DILocation(line: 94, column: 12, scope: !77)
!89 = !DILocation(line: 94, column: 5, scope: !77)
!90 = !DILocation(line: 96, column: 5, scope: !77)
!91 = !DILocation(line: 97, column: 5, scope: !77)
!92 = !DILocation(line: 98, column: 5, scope: !77)
!93 = !DILocation(line: 101, column: 5, scope: !77)
!94 = !DILocation(line: 102, column: 5, scope: !77)
!95 = !DILocation(line: 103, column: 5, scope: !77)
!96 = !DILocation(line: 105, column: 5, scope: !77)
!97 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 52, type: !18, scopeLine: 53, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!98 = !DILocalVariable(name: "data", scope: !97, file: !17, line: 54, type: !4)
!99 = !DILocation(line: 54, column: 15, scope: !97)
!100 = !DILocation(line: 55, column: 10, scope: !97)
!101 = !DILocation(line: 57, column: 23, scope: !97)
!102 = !DILocation(line: 57, column: 12, scope: !97)
!103 = !DILocation(line: 57, column: 10, scope: !97)
!104 = !DILocation(line: 58, column: 9, scope: !105)
!105 = distinct !DILexicalBlock(scope: !97, file: !17, line: 58, column: 9)
!106 = !DILocation(line: 58, column: 14, scope: !105)
!107 = !DILocation(line: 58, column: 9, scope: !97)
!108 = !DILocation(line: 58, column: 24, scope: !109)
!109 = distinct !DILexicalBlock(scope: !105, file: !17, line: 58, column: 23)
!110 = !DILocation(line: 59, column: 5, scope: !97)
!111 = !DILocation(line: 59, column: 13, scope: !97)
!112 = !DILocalVariable(name: "i", scope: !113, file: !17, line: 61, type: !36)
!113 = distinct !DILexicalBlock(scope: !97, file: !17, line: 60, column: 5)
!114 = !DILocation(line: 61, column: 16, scope: !113)
!115 = !DILocalVariable(name: "source", scope: !113, file: !17, line: 62, type: !40)
!116 = !DILocation(line: 62, column: 17, scope: !113)
!117 = !DILocation(line: 63, column: 17, scope: !113)
!118 = !DILocation(line: 63, column: 9, scope: !113)
!119 = !DILocation(line: 64, column: 9, scope: !113)
!120 = !DILocation(line: 64, column: 23, scope: !113)
!121 = !DILocation(line: 66, column: 16, scope: !122)
!122 = distinct !DILexicalBlock(scope: !113, file: !17, line: 66, column: 9)
!123 = !DILocation(line: 66, column: 14, scope: !122)
!124 = !DILocation(line: 66, column: 21, scope: !125)
!125 = distinct !DILexicalBlock(scope: !122, file: !17, line: 66, column: 9)
!126 = !DILocation(line: 66, column: 23, scope: !125)
!127 = !DILocation(line: 66, column: 9, scope: !122)
!128 = !DILocation(line: 68, column: 30, scope: !129)
!129 = distinct !DILexicalBlock(scope: !125, file: !17, line: 67, column: 9)
!130 = !DILocation(line: 68, column: 23, scope: !129)
!131 = !DILocation(line: 68, column: 13, scope: !129)
!132 = !DILocation(line: 68, column: 18, scope: !129)
!133 = !DILocation(line: 68, column: 21, scope: !129)
!134 = !DILocation(line: 69, column: 9, scope: !129)
!135 = !DILocation(line: 66, column: 31, scope: !125)
!136 = !DILocation(line: 66, column: 9, scope: !125)
!137 = distinct !{!137, !127, !138, !66}
!138 = !DILocation(line: 69, column: 9, scope: !122)
!139 = !DILocation(line: 70, column: 9, scope: !113)
!140 = !DILocation(line: 70, column: 21, scope: !113)
!141 = !DILocation(line: 71, column: 20, scope: !113)
!142 = !DILocation(line: 71, column: 9, scope: !113)
!143 = !DILocation(line: 72, column: 14, scope: !113)
!144 = !DILocation(line: 72, column: 9, scope: !113)
!145 = !DILocation(line: 74, column: 1, scope: !97)
