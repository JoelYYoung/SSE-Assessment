; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_15.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_15.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_15_bad() #0 !dbg !16 {
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_15_good() #0 !dbg !74 {
entry:
  call void @goodG2B1(), !dbg !75
  call void @goodG2B2(), !dbg !76
  ret void, !dbg !77
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !78 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !84, metadata !DIExpression()), !dbg !85
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !86, metadata !DIExpression()), !dbg !87
  %call = call i64 @time(i64* null) #5, !dbg !88
  %conv = trunc i64 %call to i32, !dbg !89
  call void @srand(i32 %conv) #5, !dbg !90
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !91
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_15_good(), !dbg !92
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !93
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !94
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_15_bad(), !dbg !95
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !96
  ret i32 0, !dbg !97
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !98 {
entry:
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !99, metadata !DIExpression()), !dbg !100
  store i32* null, i32** %data, align 8, !dbg !101
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !102
  %0 = bitcast i8* %call to i32*, !dbg !103
  store i32* %0, i32** %data, align 8, !dbg !104
  %1 = load i32*, i32** %data, align 8, !dbg !105
  %cmp = icmp eq i32* %1, null, !dbg !107
  br i1 %cmp, label %if.then, label %if.end, !dbg !108

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !109
  unreachable, !dbg !109

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !111
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0, !dbg !111
  store i32 0, i32* %arrayidx, align 4, !dbg !112
  call void @llvm.dbg.declare(metadata i64* %i, metadata !113, metadata !DIExpression()), !dbg !115
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !116, metadata !DIExpression()), !dbg !117
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !118
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !119
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !120
  store i32 0, i32* %arrayidx2, align 4, !dbg !121
  store i64 0, i64* %i, align 8, !dbg !122
  br label %for.cond, !dbg !124

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !125
  %cmp3 = icmp ult i64 %3, 100, !dbg !127
  br i1 %cmp3, label %for.body, label %for.end, !dbg !128

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !129
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %4, !dbg !131
  %5 = load i32, i32* %arrayidx4, align 4, !dbg !131
  %6 = load i32*, i32** %data, align 8, !dbg !132
  %7 = load i64, i64* %i, align 8, !dbg !133
  %arrayidx5 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !132
  store i32 %5, i32* %arrayidx5, align 4, !dbg !134
  br label %for.inc, !dbg !135

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !136
  %inc = add i64 %8, 1, !dbg !136
  store i64 %inc, i64* %i, align 8, !dbg !136
  br label %for.cond, !dbg !137, !llvm.loop !138

for.end:                                          ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !140
  %arrayidx6 = getelementptr inbounds i32, i32* %9, i64 99, !dbg !140
  store i32 0, i32* %arrayidx6, align 4, !dbg !141
  %10 = load i32*, i32** %data, align 8, !dbg !142
  call void @printWLine(i32* %10), !dbg !143
  %11 = load i32*, i32** %data, align 8, !dbg !144
  %12 = bitcast i32* %11 to i8*, !dbg !144
  call void @free(i8* %12) #5, !dbg !145
  ret void, !dbg !146
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !147 {
entry:
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !148, metadata !DIExpression()), !dbg !149
  store i32* null, i32** %data, align 8, !dbg !150
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !151
  %0 = bitcast i8* %call to i32*, !dbg !152
  store i32* %0, i32** %data, align 8, !dbg !153
  %1 = load i32*, i32** %data, align 8, !dbg !154
  %cmp = icmp eq i32* %1, null, !dbg !156
  br i1 %cmp, label %if.then, label %if.end, !dbg !157

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !158
  unreachable, !dbg !158

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !160
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0, !dbg !160
  store i32 0, i32* %arrayidx, align 4, !dbg !161
  call void @llvm.dbg.declare(metadata i64* %i, metadata !162, metadata !DIExpression()), !dbg !164
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !165, metadata !DIExpression()), !dbg !166
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !167
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !168
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !169
  store i32 0, i32* %arrayidx2, align 4, !dbg !170
  store i64 0, i64* %i, align 8, !dbg !171
  br label %for.cond, !dbg !173

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !174
  %cmp3 = icmp ult i64 %3, 100, !dbg !176
  br i1 %cmp3, label %for.body, label %for.end, !dbg !177

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !178
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %4, !dbg !180
  %5 = load i32, i32* %arrayidx4, align 4, !dbg !180
  %6 = load i32*, i32** %data, align 8, !dbg !181
  %7 = load i64, i64* %i, align 8, !dbg !182
  %arrayidx5 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !181
  store i32 %5, i32* %arrayidx5, align 4, !dbg !183
  br label %for.inc, !dbg !184

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !185
  %inc = add i64 %8, 1, !dbg !185
  store i64 %inc, i64* %i, align 8, !dbg !185
  br label %for.cond, !dbg !186, !llvm.loop !187

for.end:                                          ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !189
  %arrayidx6 = getelementptr inbounds i32, i32* %9, i64 99, !dbg !189
  store i32 0, i32* %arrayidx6, align 4, !dbg !190
  %10 = load i32*, i32** %data, align 8, !dbg !191
  call void @printWLine(i32* %10), !dbg !192
  %11 = load i32*, i32** %data, align 8, !dbg !193
  %12 = bitcast i32* %11 to i8*, !dbg !193
  call void @free(i8* %12) #5, !dbg !194
  ret void, !dbg !195
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_15.c", directory: "/home/joelyang/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_15_bad", scope: !17, file: !17, line: 23, type: !18, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_15.c", directory: "/home/joelyang/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 25, type: !4)
!21 = !DILocation(line: 25, column: 15, scope: !16)
!22 = !DILocation(line: 26, column: 10, scope: !16)
!23 = !DILocation(line: 31, column: 27, scope: !16)
!24 = !DILocation(line: 31, column: 16, scope: !16)
!25 = !DILocation(line: 31, column: 14, scope: !16)
!26 = !DILocation(line: 32, column: 13, scope: !27)
!27 = distinct !DILexicalBlock(scope: !16, file: !17, line: 32, column: 13)
!28 = !DILocation(line: 32, column: 18, scope: !27)
!29 = !DILocation(line: 32, column: 13, scope: !16)
!30 = !DILocation(line: 32, column: 28, scope: !31)
!31 = distinct !DILexicalBlock(scope: !27, file: !17, line: 32, column: 27)
!32 = !DILocation(line: 33, column: 9, scope: !16)
!33 = !DILocation(line: 33, column: 17, scope: !16)
!34 = !DILocalVariable(name: "i", scope: !35, file: !17, line: 41, type: !36)
!35 = distinct !DILexicalBlock(scope: !16, file: !17, line: 40, column: 5)
!36 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !6, line: 46, baseType: !37)
!37 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!38 = !DILocation(line: 41, column: 16, scope: !35)
!39 = !DILocalVariable(name: "source", scope: !35, file: !17, line: 42, type: !40)
!40 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !41)
!41 = !{!42}
!42 = !DISubrange(count: 100)
!43 = !DILocation(line: 42, column: 17, scope: !35)
!44 = !DILocation(line: 43, column: 17, scope: !35)
!45 = !DILocation(line: 43, column: 9, scope: !35)
!46 = !DILocation(line: 44, column: 9, scope: !35)
!47 = !DILocation(line: 44, column: 23, scope: !35)
!48 = !DILocation(line: 46, column: 16, scope: !49)
!49 = distinct !DILexicalBlock(scope: !35, file: !17, line: 46, column: 9)
!50 = !DILocation(line: 46, column: 14, scope: !49)
!51 = !DILocation(line: 46, column: 21, scope: !52)
!52 = distinct !DILexicalBlock(scope: !49, file: !17, line: 46, column: 9)
!53 = !DILocation(line: 46, column: 23, scope: !52)
!54 = !DILocation(line: 46, column: 9, scope: !49)
!55 = !DILocation(line: 48, column: 30, scope: !56)
!56 = distinct !DILexicalBlock(scope: !52, file: !17, line: 47, column: 9)
!57 = !DILocation(line: 48, column: 23, scope: !56)
!58 = !DILocation(line: 48, column: 13, scope: !56)
!59 = !DILocation(line: 48, column: 18, scope: !56)
!60 = !DILocation(line: 48, column: 21, scope: !56)
!61 = !DILocation(line: 49, column: 9, scope: !56)
!62 = !DILocation(line: 46, column: 31, scope: !52)
!63 = !DILocation(line: 46, column: 9, scope: !52)
!64 = distinct !{!64, !54, !65, !66}
!65 = !DILocation(line: 49, column: 9, scope: !49)
!66 = !{!"llvm.loop.mustprogress"}
!67 = !DILocation(line: 50, column: 9, scope: !35)
!68 = !DILocation(line: 50, column: 21, scope: !35)
!69 = !DILocation(line: 51, column: 20, scope: !35)
!70 = !DILocation(line: 51, column: 9, scope: !35)
!71 = !DILocation(line: 52, column: 14, scope: !35)
!72 = !DILocation(line: 52, column: 9, scope: !35)
!73 = !DILocation(line: 54, column: 1, scope: !16)
!74 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_15_good", scope: !17, file: !17, line: 128, type: !18, scopeLine: 129, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!75 = !DILocation(line: 130, column: 5, scope: !74)
!76 = !DILocation(line: 131, column: 5, scope: !74)
!77 = !DILocation(line: 132, column: 1, scope: !74)
!78 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 144, type: !79, scopeLine: 145, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!79 = !DISubroutineType(types: !80)
!80 = !{!7, !7, !81}
!81 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !82, size: 64)
!82 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !83, size: 64)
!83 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!84 = !DILocalVariable(name: "argc", arg: 1, scope: !78, file: !17, line: 144, type: !7)
!85 = !DILocation(line: 144, column: 14, scope: !78)
!86 = !DILocalVariable(name: "argv", arg: 2, scope: !78, file: !17, line: 144, type: !81)
!87 = !DILocation(line: 144, column: 27, scope: !78)
!88 = !DILocation(line: 147, column: 22, scope: !78)
!89 = !DILocation(line: 147, column: 12, scope: !78)
!90 = !DILocation(line: 147, column: 5, scope: !78)
!91 = !DILocation(line: 149, column: 5, scope: !78)
!92 = !DILocation(line: 150, column: 5, scope: !78)
!93 = !DILocation(line: 151, column: 5, scope: !78)
!94 = !DILocation(line: 154, column: 5, scope: !78)
!95 = !DILocation(line: 155, column: 5, scope: !78)
!96 = !DILocation(line: 156, column: 5, scope: !78)
!97 = !DILocation(line: 158, column: 5, scope: !78)
!98 = distinct !DISubprogram(name: "goodG2B1", scope: !17, file: !17, line: 61, type: !18, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!99 = !DILocalVariable(name: "data", scope: !98, file: !17, line: 63, type: !4)
!100 = !DILocation(line: 63, column: 15, scope: !98)
!101 = !DILocation(line: 64, column: 10, scope: !98)
!102 = !DILocation(line: 73, column: 27, scope: !98)
!103 = !DILocation(line: 73, column: 16, scope: !98)
!104 = !DILocation(line: 73, column: 14, scope: !98)
!105 = !DILocation(line: 74, column: 13, scope: !106)
!106 = distinct !DILexicalBlock(scope: !98, file: !17, line: 74, column: 13)
!107 = !DILocation(line: 74, column: 18, scope: !106)
!108 = !DILocation(line: 74, column: 13, scope: !98)
!109 = !DILocation(line: 74, column: 28, scope: !110)
!110 = distinct !DILexicalBlock(scope: !106, file: !17, line: 74, column: 27)
!111 = !DILocation(line: 75, column: 9, scope: !98)
!112 = !DILocation(line: 75, column: 17, scope: !98)
!113 = !DILocalVariable(name: "i", scope: !114, file: !17, line: 79, type: !36)
!114 = distinct !DILexicalBlock(scope: !98, file: !17, line: 78, column: 5)
!115 = !DILocation(line: 79, column: 16, scope: !114)
!116 = !DILocalVariable(name: "source", scope: !114, file: !17, line: 80, type: !40)
!117 = !DILocation(line: 80, column: 17, scope: !114)
!118 = !DILocation(line: 81, column: 17, scope: !114)
!119 = !DILocation(line: 81, column: 9, scope: !114)
!120 = !DILocation(line: 82, column: 9, scope: !114)
!121 = !DILocation(line: 82, column: 23, scope: !114)
!122 = !DILocation(line: 84, column: 16, scope: !123)
!123 = distinct !DILexicalBlock(scope: !114, file: !17, line: 84, column: 9)
!124 = !DILocation(line: 84, column: 14, scope: !123)
!125 = !DILocation(line: 84, column: 21, scope: !126)
!126 = distinct !DILexicalBlock(scope: !123, file: !17, line: 84, column: 9)
!127 = !DILocation(line: 84, column: 23, scope: !126)
!128 = !DILocation(line: 84, column: 9, scope: !123)
!129 = !DILocation(line: 86, column: 30, scope: !130)
!130 = distinct !DILexicalBlock(scope: !126, file: !17, line: 85, column: 9)
!131 = !DILocation(line: 86, column: 23, scope: !130)
!132 = !DILocation(line: 86, column: 13, scope: !130)
!133 = !DILocation(line: 86, column: 18, scope: !130)
!134 = !DILocation(line: 86, column: 21, scope: !130)
!135 = !DILocation(line: 87, column: 9, scope: !130)
!136 = !DILocation(line: 84, column: 31, scope: !126)
!137 = !DILocation(line: 84, column: 9, scope: !126)
!138 = distinct !{!138, !128, !139, !66}
!139 = !DILocation(line: 87, column: 9, scope: !123)
!140 = !DILocation(line: 88, column: 9, scope: !114)
!141 = !DILocation(line: 88, column: 21, scope: !114)
!142 = !DILocation(line: 89, column: 20, scope: !114)
!143 = !DILocation(line: 89, column: 9, scope: !114)
!144 = !DILocation(line: 90, column: 14, scope: !114)
!145 = !DILocation(line: 90, column: 9, scope: !114)
!146 = !DILocation(line: 92, column: 1, scope: !98)
!147 = distinct !DISubprogram(name: "goodG2B2", scope: !17, file: !17, line: 95, type: !18, scopeLine: 96, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!148 = !DILocalVariable(name: "data", scope: !147, file: !17, line: 97, type: !4)
!149 = !DILocation(line: 97, column: 15, scope: !147)
!150 = !DILocation(line: 98, column: 10, scope: !147)
!151 = !DILocation(line: 103, column: 27, scope: !147)
!152 = !DILocation(line: 103, column: 16, scope: !147)
!153 = !DILocation(line: 103, column: 14, scope: !147)
!154 = !DILocation(line: 104, column: 13, scope: !155)
!155 = distinct !DILexicalBlock(scope: !147, file: !17, line: 104, column: 13)
!156 = !DILocation(line: 104, column: 18, scope: !155)
!157 = !DILocation(line: 104, column: 13, scope: !147)
!158 = !DILocation(line: 104, column: 28, scope: !159)
!159 = distinct !DILexicalBlock(scope: !155, file: !17, line: 104, column: 27)
!160 = !DILocation(line: 105, column: 9, scope: !147)
!161 = !DILocation(line: 105, column: 17, scope: !147)
!162 = !DILocalVariable(name: "i", scope: !163, file: !17, line: 113, type: !36)
!163 = distinct !DILexicalBlock(scope: !147, file: !17, line: 112, column: 5)
!164 = !DILocation(line: 113, column: 16, scope: !163)
!165 = !DILocalVariable(name: "source", scope: !163, file: !17, line: 114, type: !40)
!166 = !DILocation(line: 114, column: 17, scope: !163)
!167 = !DILocation(line: 115, column: 17, scope: !163)
!168 = !DILocation(line: 115, column: 9, scope: !163)
!169 = !DILocation(line: 116, column: 9, scope: !163)
!170 = !DILocation(line: 116, column: 23, scope: !163)
!171 = !DILocation(line: 118, column: 16, scope: !172)
!172 = distinct !DILexicalBlock(scope: !163, file: !17, line: 118, column: 9)
!173 = !DILocation(line: 118, column: 14, scope: !172)
!174 = !DILocation(line: 118, column: 21, scope: !175)
!175 = distinct !DILexicalBlock(scope: !172, file: !17, line: 118, column: 9)
!176 = !DILocation(line: 118, column: 23, scope: !175)
!177 = !DILocation(line: 118, column: 9, scope: !172)
!178 = !DILocation(line: 120, column: 30, scope: !179)
!179 = distinct !DILexicalBlock(scope: !175, file: !17, line: 119, column: 9)
!180 = !DILocation(line: 120, column: 23, scope: !179)
!181 = !DILocation(line: 120, column: 13, scope: !179)
!182 = !DILocation(line: 120, column: 18, scope: !179)
!183 = !DILocation(line: 120, column: 21, scope: !179)
!184 = !DILocation(line: 121, column: 9, scope: !179)
!185 = !DILocation(line: 118, column: 31, scope: !175)
!186 = !DILocation(line: 118, column: 9, scope: !175)
!187 = distinct !{!187, !177, !188, !66}
!188 = !DILocation(line: 121, column: 9, scope: !172)
!189 = !DILocation(line: 122, column: 9, scope: !163)
!190 = !DILocation(line: 122, column: 21, scope: !163)
!191 = !DILocation(line: 123, column: 20, scope: !163)
!192 = !DILocation(line: 123, column: 9, scope: !163)
!193 = !DILocation(line: 124, column: 14, scope: !163)
!194 = !DILocation(line: 124, column: 9, scope: !163)
!195 = !DILocation(line: 126, column: 1, scope: !147)
