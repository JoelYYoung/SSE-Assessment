; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_02.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_02.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_02_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  %call = call noalias align 16 i8* @malloc(i64 400) #7, !dbg !22
  %0 = bitcast i8* %call to i32*, !dbg !23
  store i32* %0, i32** %data, align 8, !dbg !24
  %1 = load i32*, i32** %data, align 8, !dbg !25
  %cmp = icmp eq i32* %1, null, !dbg !27
  br i1 %cmp, label %if.then, label %if.end, !dbg !28

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !29
  unreachable, !dbg !29

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !31
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 99) #7, !dbg !34
  %3 = load i32*, i32** %data, align 8, !dbg !35
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !35
  store i32 0, i32* %arrayidx, align 4, !dbg !36
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !37, metadata !DIExpression()), !dbg !42
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !42
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !42
  call void @llvm.dbg.declare(metadata i64* %i, metadata !43, metadata !DIExpression()), !dbg !46
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !47, metadata !DIExpression()), !dbg !48
  %5 = load i32*, i32** %data, align 8, !dbg !49
  %call2 = call i64 @wcslen(i32* %5) #9, !dbg !50
  store i64 %call2, i64* %dataLen, align 8, !dbg !51
  store i64 0, i64* %i, align 8, !dbg !52
  br label %for.cond, !dbg !54

for.cond:                                         ; preds = %for.inc, %if.end
  %6 = load i64, i64* %i, align 8, !dbg !55
  %7 = load i64, i64* %dataLen, align 8, !dbg !57
  %cmp3 = icmp ult i64 %6, %7, !dbg !58
  br i1 %cmp3, label %for.body, label %for.end, !dbg !59

for.body:                                         ; preds = %for.cond
  %8 = load i32*, i32** %data, align 8, !dbg !60
  %9 = load i64, i64* %i, align 8, !dbg !62
  %arrayidx4 = getelementptr inbounds i32, i32* %8, i64 %9, !dbg !60
  %10 = load i32, i32* %arrayidx4, align 4, !dbg !60
  %11 = load i64, i64* %i, align 8, !dbg !63
  %arrayidx5 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %11, !dbg !64
  store i32 %10, i32* %arrayidx5, align 4, !dbg !65
  br label %for.inc, !dbg !66

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !67
  %inc = add i64 %12, 1, !dbg !67
  store i64 %inc, i64* %i, align 8, !dbg !67
  br label %for.cond, !dbg !68, !llvm.loop !69

for.end:                                          ; preds = %for.cond
  %arrayidx6 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !72
  store i32 0, i32* %arrayidx6, align 4, !dbg !73
  %13 = load i32*, i32** %data, align 8, !dbg !74
  call void @printWLine(i32* %13), !dbg !75
  %14 = load i32*, i32** %data, align 8, !dbg !76
  %15 = bitcast i32* %14 to i8*, !dbg !76
  call void @free(i8* %15) #7, !dbg !77
  ret void, !dbg !78
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #5

declare dso_local void @printWLine(i32*) #6

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_02_good() #0 !dbg !79 {
entry:
  call void @goodG2B1(), !dbg !80
  call void @goodG2B2(), !dbg !81
  ret void, !dbg !82
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !83 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !89, metadata !DIExpression()), !dbg !90
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !91, metadata !DIExpression()), !dbg !92
  %call = call i64 @time(i64* null) #7, !dbg !93
  %conv = trunc i64 %call to i32, !dbg !94
  call void @srand(i32 %conv) #7, !dbg !95
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !96
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_02_good(), !dbg !97
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !98
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !99
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_02_bad(), !dbg !100
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !101
  ret i32 0, !dbg !102
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !103 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !104, metadata !DIExpression()), !dbg !105
  %call = call noalias align 16 i8* @malloc(i64 400) #7, !dbg !106
  %0 = bitcast i8* %call to i32*, !dbg !107
  store i32* %0, i32** %data, align 8, !dbg !108
  %1 = load i32*, i32** %data, align 8, !dbg !109
  %cmp = icmp eq i32* %1, null, !dbg !111
  br i1 %cmp, label %if.then, label %if.end, !dbg !112

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !113
  unreachable, !dbg !113

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !115
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 49) #7, !dbg !118
  %3 = load i32*, i32** %data, align 8, !dbg !119
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !119
  store i32 0, i32* %arrayidx, align 4, !dbg !120
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !121, metadata !DIExpression()), !dbg !123
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !123
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !123
  call void @llvm.dbg.declare(metadata i64* %i, metadata !124, metadata !DIExpression()), !dbg !125
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !126, metadata !DIExpression()), !dbg !127
  %5 = load i32*, i32** %data, align 8, !dbg !128
  %call2 = call i64 @wcslen(i32* %5) #9, !dbg !129
  store i64 %call2, i64* %dataLen, align 8, !dbg !130
  store i64 0, i64* %i, align 8, !dbg !131
  br label %for.cond, !dbg !133

for.cond:                                         ; preds = %for.inc, %if.end
  %6 = load i64, i64* %i, align 8, !dbg !134
  %7 = load i64, i64* %dataLen, align 8, !dbg !136
  %cmp3 = icmp ult i64 %6, %7, !dbg !137
  br i1 %cmp3, label %for.body, label %for.end, !dbg !138

for.body:                                         ; preds = %for.cond
  %8 = load i32*, i32** %data, align 8, !dbg !139
  %9 = load i64, i64* %i, align 8, !dbg !141
  %arrayidx4 = getelementptr inbounds i32, i32* %8, i64 %9, !dbg !139
  %10 = load i32, i32* %arrayidx4, align 4, !dbg !139
  %11 = load i64, i64* %i, align 8, !dbg !142
  %arrayidx5 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %11, !dbg !143
  store i32 %10, i32* %arrayidx5, align 4, !dbg !144
  br label %for.inc, !dbg !145

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !146
  %inc = add i64 %12, 1, !dbg !146
  store i64 %inc, i64* %i, align 8, !dbg !146
  br label %for.cond, !dbg !147, !llvm.loop !148

for.end:                                          ; preds = %for.cond
  %arrayidx6 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !150
  store i32 0, i32* %arrayidx6, align 4, !dbg !151
  %13 = load i32*, i32** %data, align 8, !dbg !152
  call void @printWLine(i32* %13), !dbg !153
  %14 = load i32*, i32** %data, align 8, !dbg !154
  %15 = bitcast i32* %14 to i8*, !dbg !154
  call void @free(i8* %15) #7, !dbg !155
  ret void, !dbg !156
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !157 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !158, metadata !DIExpression()), !dbg !159
  %call = call noalias align 16 i8* @malloc(i64 400) #7, !dbg !160
  %0 = bitcast i8* %call to i32*, !dbg !161
  store i32* %0, i32** %data, align 8, !dbg !162
  %1 = load i32*, i32** %data, align 8, !dbg !163
  %cmp = icmp eq i32* %1, null, !dbg !165
  br i1 %cmp, label %if.then, label %if.end, !dbg !166

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !167
  unreachable, !dbg !167

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !169
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 49) #7, !dbg !172
  %3 = load i32*, i32** %data, align 8, !dbg !173
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !173
  store i32 0, i32* %arrayidx, align 4, !dbg !174
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !175, metadata !DIExpression()), !dbg !177
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !177
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !177
  call void @llvm.dbg.declare(metadata i64* %i, metadata !178, metadata !DIExpression()), !dbg !179
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !180, metadata !DIExpression()), !dbg !181
  %5 = load i32*, i32** %data, align 8, !dbg !182
  %call2 = call i64 @wcslen(i32* %5) #9, !dbg !183
  store i64 %call2, i64* %dataLen, align 8, !dbg !184
  store i64 0, i64* %i, align 8, !dbg !185
  br label %for.cond, !dbg !187

for.cond:                                         ; preds = %for.inc, %if.end
  %6 = load i64, i64* %i, align 8, !dbg !188
  %7 = load i64, i64* %dataLen, align 8, !dbg !190
  %cmp3 = icmp ult i64 %6, %7, !dbg !191
  br i1 %cmp3, label %for.body, label %for.end, !dbg !192

for.body:                                         ; preds = %for.cond
  %8 = load i32*, i32** %data, align 8, !dbg !193
  %9 = load i64, i64* %i, align 8, !dbg !195
  %arrayidx4 = getelementptr inbounds i32, i32* %8, i64 %9, !dbg !193
  %10 = load i32, i32* %arrayidx4, align 4, !dbg !193
  %11 = load i64, i64* %i, align 8, !dbg !196
  %arrayidx5 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %11, !dbg !197
  store i32 %10, i32* %arrayidx5, align 4, !dbg !198
  br label %for.inc, !dbg !199

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !200
  %inc = add i64 %12, 1, !dbg !200
  store i64 %inc, i64* %i, align 8, !dbg !200
  br label %for.cond, !dbg !201, !llvm.loop !202

for.end:                                          ; preds = %for.cond
  %arrayidx6 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !204
  store i32 0, i32* %arrayidx6, align 4, !dbg !205
  %13 = load i32*, i32** %data, align 8, !dbg !206
  call void @printWLine(i32* %13), !dbg !207
  %14 = load i32*, i32** %data, align 8, !dbg !208
  %15 = bitcast i32* %14 to i8*, !dbg !208
  call void @free(i8* %15) #7, !dbg !209
  ret void, !dbg !210
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
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_02.c", directory: "/root/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_02_bad", scope: !17, file: !17, line: 23, type: !18, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_02.c", directory: "/root/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 25, type: !4)
!21 = !DILocation(line: 25, column: 15, scope: !16)
!22 = !DILocation(line: 26, column: 23, scope: !16)
!23 = !DILocation(line: 26, column: 12, scope: !16)
!24 = !DILocation(line: 26, column: 10, scope: !16)
!25 = !DILocation(line: 27, column: 9, scope: !26)
!26 = distinct !DILexicalBlock(scope: !16, file: !17, line: 27, column: 9)
!27 = !DILocation(line: 27, column: 14, scope: !26)
!28 = !DILocation(line: 27, column: 9, scope: !16)
!29 = !DILocation(line: 27, column: 24, scope: !30)
!30 = distinct !DILexicalBlock(scope: !26, file: !17, line: 27, column: 23)
!31 = !DILocation(line: 31, column: 17, scope: !32)
!32 = distinct !DILexicalBlock(scope: !33, file: !17, line: 29, column: 5)
!33 = distinct !DILexicalBlock(scope: !16, file: !17, line: 28, column: 8)
!34 = !DILocation(line: 31, column: 9, scope: !32)
!35 = !DILocation(line: 32, column: 9, scope: !32)
!36 = !DILocation(line: 32, column: 21, scope: !32)
!37 = !DILocalVariable(name: "dest", scope: !38, file: !17, line: 35, type: !39)
!38 = distinct !DILexicalBlock(scope: !16, file: !17, line: 34, column: 5)
!39 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 1600, elements: !40)
!40 = !{!41}
!41 = !DISubrange(count: 50)
!42 = !DILocation(line: 35, column: 17, scope: !38)
!43 = !DILocalVariable(name: "i", scope: !38, file: !17, line: 36, type: !44)
!44 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !6, line: 46, baseType: !45)
!45 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!46 = !DILocation(line: 36, column: 16, scope: !38)
!47 = !DILocalVariable(name: "dataLen", scope: !38, file: !17, line: 36, type: !44)
!48 = !DILocation(line: 36, column: 19, scope: !38)
!49 = !DILocation(line: 37, column: 26, scope: !38)
!50 = !DILocation(line: 37, column: 19, scope: !38)
!51 = !DILocation(line: 37, column: 17, scope: !38)
!52 = !DILocation(line: 39, column: 16, scope: !53)
!53 = distinct !DILexicalBlock(scope: !38, file: !17, line: 39, column: 9)
!54 = !DILocation(line: 39, column: 14, scope: !53)
!55 = !DILocation(line: 39, column: 21, scope: !56)
!56 = distinct !DILexicalBlock(scope: !53, file: !17, line: 39, column: 9)
!57 = !DILocation(line: 39, column: 25, scope: !56)
!58 = !DILocation(line: 39, column: 23, scope: !56)
!59 = !DILocation(line: 39, column: 9, scope: !53)
!60 = !DILocation(line: 41, column: 23, scope: !61)
!61 = distinct !DILexicalBlock(scope: !56, file: !17, line: 40, column: 9)
!62 = !DILocation(line: 41, column: 28, scope: !61)
!63 = !DILocation(line: 41, column: 18, scope: !61)
!64 = !DILocation(line: 41, column: 13, scope: !61)
!65 = !DILocation(line: 41, column: 21, scope: !61)
!66 = !DILocation(line: 42, column: 9, scope: !61)
!67 = !DILocation(line: 39, column: 35, scope: !56)
!68 = !DILocation(line: 39, column: 9, scope: !56)
!69 = distinct !{!69, !59, !70, !71}
!70 = !DILocation(line: 42, column: 9, scope: !53)
!71 = !{!"llvm.loop.mustprogress"}
!72 = !DILocation(line: 43, column: 9, scope: !38)
!73 = !DILocation(line: 43, column: 20, scope: !38)
!74 = !DILocation(line: 44, column: 20, scope: !38)
!75 = !DILocation(line: 44, column: 9, scope: !38)
!76 = !DILocation(line: 45, column: 14, scope: !38)
!77 = !DILocation(line: 45, column: 9, scope: !38)
!78 = !DILocation(line: 47, column: 1, scope: !16)
!79 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_02_good", scope: !17, file: !17, line: 112, type: !18, scopeLine: 113, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!80 = !DILocation(line: 114, column: 5, scope: !79)
!81 = !DILocation(line: 115, column: 5, scope: !79)
!82 = !DILocation(line: 116, column: 1, scope: !79)
!83 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 128, type: !84, scopeLine: 129, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!84 = !DISubroutineType(types: !85)
!85 = !{!7, !7, !86}
!86 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !87, size: 64)
!87 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !88, size: 64)
!88 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!89 = !DILocalVariable(name: "argc", arg: 1, scope: !83, file: !17, line: 128, type: !7)
!90 = !DILocation(line: 128, column: 14, scope: !83)
!91 = !DILocalVariable(name: "argv", arg: 2, scope: !83, file: !17, line: 128, type: !86)
!92 = !DILocation(line: 128, column: 27, scope: !83)
!93 = !DILocation(line: 131, column: 22, scope: !83)
!94 = !DILocation(line: 131, column: 12, scope: !83)
!95 = !DILocation(line: 131, column: 5, scope: !83)
!96 = !DILocation(line: 133, column: 5, scope: !83)
!97 = !DILocation(line: 134, column: 5, scope: !83)
!98 = !DILocation(line: 135, column: 5, scope: !83)
!99 = !DILocation(line: 138, column: 5, scope: !83)
!100 = !DILocation(line: 139, column: 5, scope: !83)
!101 = !DILocation(line: 140, column: 5, scope: !83)
!102 = !DILocation(line: 142, column: 5, scope: !83)
!103 = distinct !DISubprogram(name: "goodG2B1", scope: !17, file: !17, line: 54, type: !18, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!104 = !DILocalVariable(name: "data", scope: !103, file: !17, line: 56, type: !4)
!105 = !DILocation(line: 56, column: 15, scope: !103)
!106 = !DILocation(line: 57, column: 23, scope: !103)
!107 = !DILocation(line: 57, column: 12, scope: !103)
!108 = !DILocation(line: 57, column: 10, scope: !103)
!109 = !DILocation(line: 58, column: 9, scope: !110)
!110 = distinct !DILexicalBlock(scope: !103, file: !17, line: 58, column: 9)
!111 = !DILocation(line: 58, column: 14, scope: !110)
!112 = !DILocation(line: 58, column: 9, scope: !103)
!113 = !DILocation(line: 58, column: 24, scope: !114)
!114 = distinct !DILexicalBlock(scope: !110, file: !17, line: 58, column: 23)
!115 = !DILocation(line: 67, column: 17, scope: !116)
!116 = distinct !DILexicalBlock(scope: !117, file: !17, line: 65, column: 5)
!117 = distinct !DILexicalBlock(scope: !103, file: !17, line: 59, column: 8)
!118 = !DILocation(line: 67, column: 9, scope: !116)
!119 = !DILocation(line: 68, column: 9, scope: !116)
!120 = !DILocation(line: 68, column: 20, scope: !116)
!121 = !DILocalVariable(name: "dest", scope: !122, file: !17, line: 71, type: !39)
!122 = distinct !DILexicalBlock(scope: !103, file: !17, line: 70, column: 5)
!123 = !DILocation(line: 71, column: 17, scope: !122)
!124 = !DILocalVariable(name: "i", scope: !122, file: !17, line: 72, type: !44)
!125 = !DILocation(line: 72, column: 16, scope: !122)
!126 = !DILocalVariable(name: "dataLen", scope: !122, file: !17, line: 72, type: !44)
!127 = !DILocation(line: 72, column: 19, scope: !122)
!128 = !DILocation(line: 73, column: 26, scope: !122)
!129 = !DILocation(line: 73, column: 19, scope: !122)
!130 = !DILocation(line: 73, column: 17, scope: !122)
!131 = !DILocation(line: 75, column: 16, scope: !132)
!132 = distinct !DILexicalBlock(scope: !122, file: !17, line: 75, column: 9)
!133 = !DILocation(line: 75, column: 14, scope: !132)
!134 = !DILocation(line: 75, column: 21, scope: !135)
!135 = distinct !DILexicalBlock(scope: !132, file: !17, line: 75, column: 9)
!136 = !DILocation(line: 75, column: 25, scope: !135)
!137 = !DILocation(line: 75, column: 23, scope: !135)
!138 = !DILocation(line: 75, column: 9, scope: !132)
!139 = !DILocation(line: 77, column: 23, scope: !140)
!140 = distinct !DILexicalBlock(scope: !135, file: !17, line: 76, column: 9)
!141 = !DILocation(line: 77, column: 28, scope: !140)
!142 = !DILocation(line: 77, column: 18, scope: !140)
!143 = !DILocation(line: 77, column: 13, scope: !140)
!144 = !DILocation(line: 77, column: 21, scope: !140)
!145 = !DILocation(line: 78, column: 9, scope: !140)
!146 = !DILocation(line: 75, column: 35, scope: !135)
!147 = !DILocation(line: 75, column: 9, scope: !135)
!148 = distinct !{!148, !138, !149, !71}
!149 = !DILocation(line: 78, column: 9, scope: !132)
!150 = !DILocation(line: 79, column: 9, scope: !122)
!151 = !DILocation(line: 79, column: 20, scope: !122)
!152 = !DILocation(line: 80, column: 20, scope: !122)
!153 = !DILocation(line: 80, column: 9, scope: !122)
!154 = !DILocation(line: 81, column: 14, scope: !122)
!155 = !DILocation(line: 81, column: 9, scope: !122)
!156 = !DILocation(line: 83, column: 1, scope: !103)
!157 = distinct !DISubprogram(name: "goodG2B2", scope: !17, file: !17, line: 86, type: !18, scopeLine: 87, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!158 = !DILocalVariable(name: "data", scope: !157, file: !17, line: 88, type: !4)
!159 = !DILocation(line: 88, column: 15, scope: !157)
!160 = !DILocation(line: 89, column: 23, scope: !157)
!161 = !DILocation(line: 89, column: 12, scope: !157)
!162 = !DILocation(line: 89, column: 10, scope: !157)
!163 = !DILocation(line: 90, column: 9, scope: !164)
!164 = distinct !DILexicalBlock(scope: !157, file: !17, line: 90, column: 9)
!165 = !DILocation(line: 90, column: 14, scope: !164)
!166 = !DILocation(line: 90, column: 9, scope: !157)
!167 = !DILocation(line: 90, column: 24, scope: !168)
!168 = distinct !DILexicalBlock(scope: !164, file: !17, line: 90, column: 23)
!169 = !DILocation(line: 94, column: 17, scope: !170)
!170 = distinct !DILexicalBlock(scope: !171, file: !17, line: 92, column: 5)
!171 = distinct !DILexicalBlock(scope: !157, file: !17, line: 91, column: 8)
!172 = !DILocation(line: 94, column: 9, scope: !170)
!173 = !DILocation(line: 95, column: 9, scope: !170)
!174 = !DILocation(line: 95, column: 20, scope: !170)
!175 = !DILocalVariable(name: "dest", scope: !176, file: !17, line: 98, type: !39)
!176 = distinct !DILexicalBlock(scope: !157, file: !17, line: 97, column: 5)
!177 = !DILocation(line: 98, column: 17, scope: !176)
!178 = !DILocalVariable(name: "i", scope: !176, file: !17, line: 99, type: !44)
!179 = !DILocation(line: 99, column: 16, scope: !176)
!180 = !DILocalVariable(name: "dataLen", scope: !176, file: !17, line: 99, type: !44)
!181 = !DILocation(line: 99, column: 19, scope: !176)
!182 = !DILocation(line: 100, column: 26, scope: !176)
!183 = !DILocation(line: 100, column: 19, scope: !176)
!184 = !DILocation(line: 100, column: 17, scope: !176)
!185 = !DILocation(line: 102, column: 16, scope: !186)
!186 = distinct !DILexicalBlock(scope: !176, file: !17, line: 102, column: 9)
!187 = !DILocation(line: 102, column: 14, scope: !186)
!188 = !DILocation(line: 102, column: 21, scope: !189)
!189 = distinct !DILexicalBlock(scope: !186, file: !17, line: 102, column: 9)
!190 = !DILocation(line: 102, column: 25, scope: !189)
!191 = !DILocation(line: 102, column: 23, scope: !189)
!192 = !DILocation(line: 102, column: 9, scope: !186)
!193 = !DILocation(line: 104, column: 23, scope: !194)
!194 = distinct !DILexicalBlock(scope: !189, file: !17, line: 103, column: 9)
!195 = !DILocation(line: 104, column: 28, scope: !194)
!196 = !DILocation(line: 104, column: 18, scope: !194)
!197 = !DILocation(line: 104, column: 13, scope: !194)
!198 = !DILocation(line: 104, column: 21, scope: !194)
!199 = !DILocation(line: 105, column: 9, scope: !194)
!200 = !DILocation(line: 102, column: 35, scope: !189)
!201 = !DILocation(line: 102, column: 9, scope: !189)
!202 = distinct !{!202, !192, !203, !71}
!203 = !DILocation(line: 105, column: 9, scope: !186)
!204 = !DILocation(line: 106, column: 9, scope: !176)
!205 = !DILocation(line: 106, column: 20, scope: !176)
!206 = !DILocation(line: 107, column: 20, scope: !176)
!207 = !DILocation(line: 107, column: 9, scope: !176)
!208 = !DILocation(line: 108, column: 14, scope: !176)
!209 = !DILocation(line: 108, column: 9, scope: !176)
!210 = !DILocation(line: 110, column: 1, scope: !157)
