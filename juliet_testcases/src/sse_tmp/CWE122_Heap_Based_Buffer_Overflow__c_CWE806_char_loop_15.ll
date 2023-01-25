; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_15.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_15.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_15_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !20
  store i8* %call, i8** %data, align 8, !dbg !21
  %0 = load i8*, i8** %data, align 8, !dbg !22
  %cmp = icmp eq i8* %0, null, !dbg !24
  br i1 %cmp, label %if.then, label %if.end, !dbg !25

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !26
  unreachable, !dbg !26

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !28
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !29
  %2 = load i8*, i8** %data, align 8, !dbg !30
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !30
  store i8 0, i8* %arrayidx, align 1, !dbg !31
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !32, metadata !DIExpression()), !dbg !37
  %3 = bitcast [50 x i8]* %dest to i8*, !dbg !37
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 50, i1 false), !dbg !37
  call void @llvm.dbg.declare(metadata i64* %i, metadata !38, metadata !DIExpression()), !dbg !42
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !43, metadata !DIExpression()), !dbg !44
  %4 = load i8*, i8** %data, align 8, !dbg !45
  %call1 = call i64 @strlen(i8* %4) #9, !dbg !46
  store i64 %call1, i64* %dataLen, align 8, !dbg !47
  store i64 0, i64* %i, align 8, !dbg !48
  br label %for.cond, !dbg !50

for.cond:                                         ; preds = %for.inc, %if.end
  %5 = load i64, i64* %i, align 8, !dbg !51
  %6 = load i64, i64* %dataLen, align 8, !dbg !53
  %cmp2 = icmp ult i64 %5, %6, !dbg !54
  br i1 %cmp2, label %for.body, label %for.end, !dbg !55

for.body:                                         ; preds = %for.cond
  %7 = load i8*, i8** %data, align 8, !dbg !56
  %8 = load i64, i64* %i, align 8, !dbg !58
  %arrayidx3 = getelementptr inbounds i8, i8* %7, i64 %8, !dbg !56
  %9 = load i8, i8* %arrayidx3, align 1, !dbg !56
  %10 = load i64, i64* %i, align 8, !dbg !59
  %arrayidx4 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %10, !dbg !60
  store i8 %9, i8* %arrayidx4, align 1, !dbg !61
  br label %for.inc, !dbg !62

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !63
  %inc = add i64 %11, 1, !dbg !63
  store i64 %inc, i64* %i, align 8, !dbg !63
  br label %for.cond, !dbg !64, !llvm.loop !65

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !68
  store i8 0, i8* %arrayidx5, align 1, !dbg !69
  %12 = load i8*, i8** %data, align 8, !dbg !70
  call void @printLine(i8* %12), !dbg !71
  %13 = load i8*, i8** %data, align 8, !dbg !72
  call void @free(i8* %13) #7, !dbg !73
  ret void, !dbg !74
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #5

declare dso_local void @printLine(i8*) #6

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_15_good() #0 !dbg !75 {
entry:
  call void @goodG2B1(), !dbg !76
  call void @goodG2B2(), !dbg !77
  ret void, !dbg !78
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !79 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !84, metadata !DIExpression()), !dbg !85
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !86, metadata !DIExpression()), !dbg !87
  %call = call i64 @time(i64* null) #7, !dbg !88
  %conv = trunc i64 %call to i32, !dbg !89
  call void @srand(i32 %conv) #7, !dbg !90
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !91
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_15_good(), !dbg !92
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !93
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !94
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_15_bad(), !dbg !95
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !96
  ret i32 0, !dbg !97
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !98 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !99, metadata !DIExpression()), !dbg !100
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !101
  store i8* %call, i8** %data, align 8, !dbg !102
  %0 = load i8*, i8** %data, align 8, !dbg !103
  %cmp = icmp eq i8* %0, null, !dbg !105
  br i1 %cmp, label %if.then, label %if.end, !dbg !106

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !107
  unreachable, !dbg !107

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !109
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 49, i1 false), !dbg !110
  %2 = load i8*, i8** %data, align 8, !dbg !111
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 49, !dbg !111
  store i8 0, i8* %arrayidx, align 1, !dbg !112
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !113, metadata !DIExpression()), !dbg !115
  %3 = bitcast [50 x i8]* %dest to i8*, !dbg !115
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 50, i1 false), !dbg !115
  call void @llvm.dbg.declare(metadata i64* %i, metadata !116, metadata !DIExpression()), !dbg !117
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !118, metadata !DIExpression()), !dbg !119
  %4 = load i8*, i8** %data, align 8, !dbg !120
  %call1 = call i64 @strlen(i8* %4) #9, !dbg !121
  store i64 %call1, i64* %dataLen, align 8, !dbg !122
  store i64 0, i64* %i, align 8, !dbg !123
  br label %for.cond, !dbg !125

for.cond:                                         ; preds = %for.inc, %if.end
  %5 = load i64, i64* %i, align 8, !dbg !126
  %6 = load i64, i64* %dataLen, align 8, !dbg !128
  %cmp2 = icmp ult i64 %5, %6, !dbg !129
  br i1 %cmp2, label %for.body, label %for.end, !dbg !130

for.body:                                         ; preds = %for.cond
  %7 = load i8*, i8** %data, align 8, !dbg !131
  %8 = load i64, i64* %i, align 8, !dbg !133
  %arrayidx3 = getelementptr inbounds i8, i8* %7, i64 %8, !dbg !131
  %9 = load i8, i8* %arrayidx3, align 1, !dbg !131
  %10 = load i64, i64* %i, align 8, !dbg !134
  %arrayidx4 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %10, !dbg !135
  store i8 %9, i8* %arrayidx4, align 1, !dbg !136
  br label %for.inc, !dbg !137

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !138
  %inc = add i64 %11, 1, !dbg !138
  store i64 %inc, i64* %i, align 8, !dbg !138
  br label %for.cond, !dbg !139, !llvm.loop !140

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !142
  store i8 0, i8* %arrayidx5, align 1, !dbg !143
  %12 = load i8*, i8** %data, align 8, !dbg !144
  call void @printLine(i8* %12), !dbg !145
  %13 = load i8*, i8** %data, align 8, !dbg !146
  call void @free(i8* %13) #7, !dbg !147
  ret void, !dbg !148
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !149 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !150, metadata !DIExpression()), !dbg !151
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !152
  store i8* %call, i8** %data, align 8, !dbg !153
  %0 = load i8*, i8** %data, align 8, !dbg !154
  %cmp = icmp eq i8* %0, null, !dbg !156
  br i1 %cmp, label %if.then, label %if.end, !dbg !157

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !158
  unreachable, !dbg !158

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !160
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 49, i1 false), !dbg !161
  %2 = load i8*, i8** %data, align 8, !dbg !162
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 49, !dbg !162
  store i8 0, i8* %arrayidx, align 1, !dbg !163
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !164, metadata !DIExpression()), !dbg !166
  %3 = bitcast [50 x i8]* %dest to i8*, !dbg !166
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 50, i1 false), !dbg !166
  call void @llvm.dbg.declare(metadata i64* %i, metadata !167, metadata !DIExpression()), !dbg !168
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !169, metadata !DIExpression()), !dbg !170
  %4 = load i8*, i8** %data, align 8, !dbg !171
  %call1 = call i64 @strlen(i8* %4) #9, !dbg !172
  store i64 %call1, i64* %dataLen, align 8, !dbg !173
  store i64 0, i64* %i, align 8, !dbg !174
  br label %for.cond, !dbg !176

for.cond:                                         ; preds = %for.inc, %if.end
  %5 = load i64, i64* %i, align 8, !dbg !177
  %6 = load i64, i64* %dataLen, align 8, !dbg !179
  %cmp2 = icmp ult i64 %5, %6, !dbg !180
  br i1 %cmp2, label %for.body, label %for.end, !dbg !181

for.body:                                         ; preds = %for.cond
  %7 = load i8*, i8** %data, align 8, !dbg !182
  %8 = load i64, i64* %i, align 8, !dbg !184
  %arrayidx3 = getelementptr inbounds i8, i8* %7, i64 %8, !dbg !182
  %9 = load i8, i8* %arrayidx3, align 1, !dbg !182
  %10 = load i64, i64* %i, align 8, !dbg !185
  %arrayidx4 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %10, !dbg !186
  store i8 %9, i8* %arrayidx4, align 1, !dbg !187
  br label %for.inc, !dbg !188

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !189
  %inc = add i64 %11, 1, !dbg !189
  store i64 %inc, i64* %i, align 8, !dbg !189
  br label %for.cond, !dbg !190, !llvm.loop !191

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !193
  store i8 0, i8* %arrayidx5, align 1, !dbg !194
  %12 = load i8*, i8** %data, align 8, !dbg !195
  call void @printLine(i8* %12), !dbg !196
  %13 = load i8*, i8** %data, align 8, !dbg !197
  call void @free(i8* %13) #7, !dbg !198
  ret void, !dbg !199
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }
attributes #9 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_15.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_15_bad", scope: !15, file: !15, line: 23, type: !16, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_15.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 25, type: !4)
!19 = !DILocation(line: 25, column: 12, scope: !14)
!20 = !DILocation(line: 26, column: 20, scope: !14)
!21 = !DILocation(line: 26, column: 10, scope: !14)
!22 = !DILocation(line: 27, column: 9, scope: !23)
!23 = distinct !DILexicalBlock(scope: !14, file: !15, line: 27, column: 9)
!24 = !DILocation(line: 27, column: 14, scope: !23)
!25 = !DILocation(line: 27, column: 9, scope: !14)
!26 = !DILocation(line: 27, column: 24, scope: !27)
!27 = distinct !DILexicalBlock(scope: !23, file: !15, line: 27, column: 23)
!28 = !DILocation(line: 32, column: 16, scope: !14)
!29 = !DILocation(line: 32, column: 9, scope: !14)
!30 = !DILocation(line: 33, column: 9, scope: !14)
!31 = !DILocation(line: 33, column: 21, scope: !14)
!32 = !DILocalVariable(name: "dest", scope: !33, file: !15, line: 41, type: !34)
!33 = distinct !DILexicalBlock(scope: !14, file: !15, line: 40, column: 5)
!34 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 400, elements: !35)
!35 = !{!36}
!36 = !DISubrange(count: 50)
!37 = !DILocation(line: 41, column: 14, scope: !33)
!38 = !DILocalVariable(name: "i", scope: !33, file: !15, line: 42, type: !39)
!39 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !40, line: 46, baseType: !41)
!40 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!41 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!42 = !DILocation(line: 42, column: 16, scope: !33)
!43 = !DILocalVariable(name: "dataLen", scope: !33, file: !15, line: 42, type: !39)
!44 = !DILocation(line: 42, column: 19, scope: !33)
!45 = !DILocation(line: 43, column: 26, scope: !33)
!46 = !DILocation(line: 43, column: 19, scope: !33)
!47 = !DILocation(line: 43, column: 17, scope: !33)
!48 = !DILocation(line: 45, column: 16, scope: !49)
!49 = distinct !DILexicalBlock(scope: !33, file: !15, line: 45, column: 9)
!50 = !DILocation(line: 45, column: 14, scope: !49)
!51 = !DILocation(line: 45, column: 21, scope: !52)
!52 = distinct !DILexicalBlock(scope: !49, file: !15, line: 45, column: 9)
!53 = !DILocation(line: 45, column: 25, scope: !52)
!54 = !DILocation(line: 45, column: 23, scope: !52)
!55 = !DILocation(line: 45, column: 9, scope: !49)
!56 = !DILocation(line: 47, column: 23, scope: !57)
!57 = distinct !DILexicalBlock(scope: !52, file: !15, line: 46, column: 9)
!58 = !DILocation(line: 47, column: 28, scope: !57)
!59 = !DILocation(line: 47, column: 18, scope: !57)
!60 = !DILocation(line: 47, column: 13, scope: !57)
!61 = !DILocation(line: 47, column: 21, scope: !57)
!62 = !DILocation(line: 48, column: 9, scope: !57)
!63 = !DILocation(line: 45, column: 35, scope: !52)
!64 = !DILocation(line: 45, column: 9, scope: !52)
!65 = distinct !{!65, !55, !66, !67}
!66 = !DILocation(line: 48, column: 9, scope: !49)
!67 = !{!"llvm.loop.mustprogress"}
!68 = !DILocation(line: 49, column: 9, scope: !33)
!69 = !DILocation(line: 49, column: 20, scope: !33)
!70 = !DILocation(line: 50, column: 19, scope: !33)
!71 = !DILocation(line: 50, column: 9, scope: !33)
!72 = !DILocation(line: 51, column: 14, scope: !33)
!73 = !DILocation(line: 51, column: 9, scope: !33)
!74 = !DILocation(line: 53, column: 1, scope: !14)
!75 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_15_good", scope: !15, file: !15, line: 125, type: !16, scopeLine: 126, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!76 = !DILocation(line: 127, column: 5, scope: !75)
!77 = !DILocation(line: 128, column: 5, scope: !75)
!78 = !DILocation(line: 129, column: 1, scope: !75)
!79 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 141, type: !80, scopeLine: 142, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!80 = !DISubroutineType(types: !81)
!81 = !{!82, !82, !83}
!82 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!83 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!84 = !DILocalVariable(name: "argc", arg: 1, scope: !79, file: !15, line: 141, type: !82)
!85 = !DILocation(line: 141, column: 14, scope: !79)
!86 = !DILocalVariable(name: "argv", arg: 2, scope: !79, file: !15, line: 141, type: !83)
!87 = !DILocation(line: 141, column: 27, scope: !79)
!88 = !DILocation(line: 144, column: 22, scope: !79)
!89 = !DILocation(line: 144, column: 12, scope: !79)
!90 = !DILocation(line: 144, column: 5, scope: !79)
!91 = !DILocation(line: 146, column: 5, scope: !79)
!92 = !DILocation(line: 147, column: 5, scope: !79)
!93 = !DILocation(line: 148, column: 5, scope: !79)
!94 = !DILocation(line: 151, column: 5, scope: !79)
!95 = !DILocation(line: 152, column: 5, scope: !79)
!96 = !DILocation(line: 153, column: 5, scope: !79)
!97 = !DILocation(line: 155, column: 5, scope: !79)
!98 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 60, type: !16, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!99 = !DILocalVariable(name: "data", scope: !98, file: !15, line: 62, type: !4)
!100 = !DILocation(line: 62, column: 12, scope: !98)
!101 = !DILocation(line: 63, column: 20, scope: !98)
!102 = !DILocation(line: 63, column: 10, scope: !98)
!103 = !DILocation(line: 64, column: 9, scope: !104)
!104 = distinct !DILexicalBlock(scope: !98, file: !15, line: 64, column: 9)
!105 = !DILocation(line: 64, column: 14, scope: !104)
!106 = !DILocation(line: 64, column: 9, scope: !98)
!107 = !DILocation(line: 64, column: 24, scope: !108)
!108 = distinct !DILexicalBlock(scope: !104, file: !15, line: 64, column: 23)
!109 = !DILocation(line: 73, column: 16, scope: !98)
!110 = !DILocation(line: 73, column: 9, scope: !98)
!111 = !DILocation(line: 74, column: 9, scope: !98)
!112 = !DILocation(line: 74, column: 20, scope: !98)
!113 = !DILocalVariable(name: "dest", scope: !114, file: !15, line: 78, type: !34)
!114 = distinct !DILexicalBlock(scope: !98, file: !15, line: 77, column: 5)
!115 = !DILocation(line: 78, column: 14, scope: !114)
!116 = !DILocalVariable(name: "i", scope: !114, file: !15, line: 79, type: !39)
!117 = !DILocation(line: 79, column: 16, scope: !114)
!118 = !DILocalVariable(name: "dataLen", scope: !114, file: !15, line: 79, type: !39)
!119 = !DILocation(line: 79, column: 19, scope: !114)
!120 = !DILocation(line: 80, column: 26, scope: !114)
!121 = !DILocation(line: 80, column: 19, scope: !114)
!122 = !DILocation(line: 80, column: 17, scope: !114)
!123 = !DILocation(line: 82, column: 16, scope: !124)
!124 = distinct !DILexicalBlock(scope: !114, file: !15, line: 82, column: 9)
!125 = !DILocation(line: 82, column: 14, scope: !124)
!126 = !DILocation(line: 82, column: 21, scope: !127)
!127 = distinct !DILexicalBlock(scope: !124, file: !15, line: 82, column: 9)
!128 = !DILocation(line: 82, column: 25, scope: !127)
!129 = !DILocation(line: 82, column: 23, scope: !127)
!130 = !DILocation(line: 82, column: 9, scope: !124)
!131 = !DILocation(line: 84, column: 23, scope: !132)
!132 = distinct !DILexicalBlock(scope: !127, file: !15, line: 83, column: 9)
!133 = !DILocation(line: 84, column: 28, scope: !132)
!134 = !DILocation(line: 84, column: 18, scope: !132)
!135 = !DILocation(line: 84, column: 13, scope: !132)
!136 = !DILocation(line: 84, column: 21, scope: !132)
!137 = !DILocation(line: 85, column: 9, scope: !132)
!138 = !DILocation(line: 82, column: 35, scope: !127)
!139 = !DILocation(line: 82, column: 9, scope: !127)
!140 = distinct !{!140, !130, !141, !67}
!141 = !DILocation(line: 85, column: 9, scope: !124)
!142 = !DILocation(line: 86, column: 9, scope: !114)
!143 = !DILocation(line: 86, column: 20, scope: !114)
!144 = !DILocation(line: 87, column: 19, scope: !114)
!145 = !DILocation(line: 87, column: 9, scope: !114)
!146 = !DILocation(line: 88, column: 14, scope: !114)
!147 = !DILocation(line: 88, column: 9, scope: !114)
!148 = !DILocation(line: 90, column: 1, scope: !98)
!149 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 93, type: !16, scopeLine: 94, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!150 = !DILocalVariable(name: "data", scope: !149, file: !15, line: 95, type: !4)
!151 = !DILocation(line: 95, column: 12, scope: !149)
!152 = !DILocation(line: 96, column: 20, scope: !149)
!153 = !DILocation(line: 96, column: 10, scope: !149)
!154 = !DILocation(line: 97, column: 9, scope: !155)
!155 = distinct !DILexicalBlock(scope: !149, file: !15, line: 97, column: 9)
!156 = !DILocation(line: 97, column: 14, scope: !155)
!157 = !DILocation(line: 97, column: 9, scope: !149)
!158 = !DILocation(line: 97, column: 24, scope: !159)
!159 = distinct !DILexicalBlock(scope: !155, file: !15, line: 97, column: 23)
!160 = !DILocation(line: 102, column: 16, scope: !149)
!161 = !DILocation(line: 102, column: 9, scope: !149)
!162 = !DILocation(line: 103, column: 9, scope: !149)
!163 = !DILocation(line: 103, column: 20, scope: !149)
!164 = !DILocalVariable(name: "dest", scope: !165, file: !15, line: 111, type: !34)
!165 = distinct !DILexicalBlock(scope: !149, file: !15, line: 110, column: 5)
!166 = !DILocation(line: 111, column: 14, scope: !165)
!167 = !DILocalVariable(name: "i", scope: !165, file: !15, line: 112, type: !39)
!168 = !DILocation(line: 112, column: 16, scope: !165)
!169 = !DILocalVariable(name: "dataLen", scope: !165, file: !15, line: 112, type: !39)
!170 = !DILocation(line: 112, column: 19, scope: !165)
!171 = !DILocation(line: 113, column: 26, scope: !165)
!172 = !DILocation(line: 113, column: 19, scope: !165)
!173 = !DILocation(line: 113, column: 17, scope: !165)
!174 = !DILocation(line: 115, column: 16, scope: !175)
!175 = distinct !DILexicalBlock(scope: !165, file: !15, line: 115, column: 9)
!176 = !DILocation(line: 115, column: 14, scope: !175)
!177 = !DILocation(line: 115, column: 21, scope: !178)
!178 = distinct !DILexicalBlock(scope: !175, file: !15, line: 115, column: 9)
!179 = !DILocation(line: 115, column: 25, scope: !178)
!180 = !DILocation(line: 115, column: 23, scope: !178)
!181 = !DILocation(line: 115, column: 9, scope: !175)
!182 = !DILocation(line: 117, column: 23, scope: !183)
!183 = distinct !DILexicalBlock(scope: !178, file: !15, line: 116, column: 9)
!184 = !DILocation(line: 117, column: 28, scope: !183)
!185 = !DILocation(line: 117, column: 18, scope: !183)
!186 = !DILocation(line: 117, column: 13, scope: !183)
!187 = !DILocation(line: 117, column: 21, scope: !183)
!188 = !DILocation(line: 118, column: 9, scope: !183)
!189 = !DILocation(line: 115, column: 35, scope: !178)
!190 = !DILocation(line: 115, column: 9, scope: !178)
!191 = distinct !{!191, !181, !192, !67}
!192 = !DILocation(line: 118, column: 9, scope: !175)
!193 = !DILocation(line: 119, column: 9, scope: !165)
!194 = !DILocation(line: 119, column: 20, scope: !165)
!195 = !DILocation(line: 120, column: 19, scope: !165)
!196 = !DILocation(line: 120, column: 9, scope: !165)
!197 = !DILocation(line: 121, column: 14, scope: !165)
!198 = !DILocation(line: 121, column: 9, scope: !165)
!199 = !DILocation(line: 123, column: 1, scope: !149)
