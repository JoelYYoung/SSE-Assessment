; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_15.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_15.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_15_bad() #0 !dbg !16 {
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
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 99) #7, !dbg !32
  %3 = load i32*, i32** %data, align 8, !dbg !33
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !33
  store i32 0, i32* %arrayidx, align 4, !dbg !34
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !35, metadata !DIExpression()), !dbg !40
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !40
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !40
  call void @llvm.dbg.declare(metadata i64* %i, metadata !41, metadata !DIExpression()), !dbg !44
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !45, metadata !DIExpression()), !dbg !46
  %5 = load i32*, i32** %data, align 8, !dbg !47
  %call2 = call i64 @wcslen(i32* %5) #9, !dbg !48
  store i64 %call2, i64* %dataLen, align 8, !dbg !49
  store i64 0, i64* %i, align 8, !dbg !50
  br label %for.cond, !dbg !52

for.cond:                                         ; preds = %for.inc, %if.end
  %6 = load i64, i64* %i, align 8, !dbg !53
  %7 = load i64, i64* %dataLen, align 8, !dbg !55
  %cmp3 = icmp ult i64 %6, %7, !dbg !56
  br i1 %cmp3, label %for.body, label %for.end, !dbg !57

for.body:                                         ; preds = %for.cond
  %8 = load i32*, i32** %data, align 8, !dbg !58
  %9 = load i64, i64* %i, align 8, !dbg !60
  %arrayidx4 = getelementptr inbounds i32, i32* %8, i64 %9, !dbg !58
  %10 = load i32, i32* %arrayidx4, align 4, !dbg !58
  %11 = load i64, i64* %i, align 8, !dbg !61
  %arrayidx5 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %11, !dbg !62
  store i32 %10, i32* %arrayidx5, align 4, !dbg !63
  br label %for.inc, !dbg !64

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !65
  %inc = add i64 %12, 1, !dbg !65
  store i64 %inc, i64* %i, align 8, !dbg !65
  br label %for.cond, !dbg !66, !llvm.loop !67

for.end:                                          ; preds = %for.cond
  %arrayidx6 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !70
  store i32 0, i32* %arrayidx6, align 4, !dbg !71
  %13 = load i32*, i32** %data, align 8, !dbg !72
  call void @printWLine(i32* %13), !dbg !73
  %14 = load i32*, i32** %data, align 8, !dbg !74
  %15 = bitcast i32* %14 to i8*, !dbg !74
  call void @free(i8* %15) #7, !dbg !75
  ret void, !dbg !76
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_15_good() #0 !dbg !77 {
entry:
  call void @goodG2B1(), !dbg !78
  call void @goodG2B2(), !dbg !79
  ret void, !dbg !80
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !81 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !87, metadata !DIExpression()), !dbg !88
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !89, metadata !DIExpression()), !dbg !90
  %call = call i64 @time(i64* null) #7, !dbg !91
  %conv = trunc i64 %call to i32, !dbg !92
  call void @srand(i32 %conv) #7, !dbg !93
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !94
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_15_good(), !dbg !95
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !96
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !97
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_15_bad(), !dbg !98
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !99
  ret i32 0, !dbg !100
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !101 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !102, metadata !DIExpression()), !dbg !103
  %call = call noalias align 16 i8* @malloc(i64 400) #7, !dbg !104
  %0 = bitcast i8* %call to i32*, !dbg !105
  store i32* %0, i32** %data, align 8, !dbg !106
  %1 = load i32*, i32** %data, align 8, !dbg !107
  %cmp = icmp eq i32* %1, null, !dbg !109
  br i1 %cmp, label %if.then, label %if.end, !dbg !110

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !111
  unreachable, !dbg !111

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !113
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 49) #7, !dbg !114
  %3 = load i32*, i32** %data, align 8, !dbg !115
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !115
  store i32 0, i32* %arrayidx, align 4, !dbg !116
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !117, metadata !DIExpression()), !dbg !119
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !119
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !119
  call void @llvm.dbg.declare(metadata i64* %i, metadata !120, metadata !DIExpression()), !dbg !121
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !122, metadata !DIExpression()), !dbg !123
  %5 = load i32*, i32** %data, align 8, !dbg !124
  %call2 = call i64 @wcslen(i32* %5) #9, !dbg !125
  store i64 %call2, i64* %dataLen, align 8, !dbg !126
  store i64 0, i64* %i, align 8, !dbg !127
  br label %for.cond, !dbg !129

for.cond:                                         ; preds = %for.inc, %if.end
  %6 = load i64, i64* %i, align 8, !dbg !130
  %7 = load i64, i64* %dataLen, align 8, !dbg !132
  %cmp3 = icmp ult i64 %6, %7, !dbg !133
  br i1 %cmp3, label %for.body, label %for.end, !dbg !134

for.body:                                         ; preds = %for.cond
  %8 = load i32*, i32** %data, align 8, !dbg !135
  %9 = load i64, i64* %i, align 8, !dbg !137
  %arrayidx4 = getelementptr inbounds i32, i32* %8, i64 %9, !dbg !135
  %10 = load i32, i32* %arrayidx4, align 4, !dbg !135
  %11 = load i64, i64* %i, align 8, !dbg !138
  %arrayidx5 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %11, !dbg !139
  store i32 %10, i32* %arrayidx5, align 4, !dbg !140
  br label %for.inc, !dbg !141

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !142
  %inc = add i64 %12, 1, !dbg !142
  store i64 %inc, i64* %i, align 8, !dbg !142
  br label %for.cond, !dbg !143, !llvm.loop !144

for.end:                                          ; preds = %for.cond
  %arrayidx6 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !146
  store i32 0, i32* %arrayidx6, align 4, !dbg !147
  %13 = load i32*, i32** %data, align 8, !dbg !148
  call void @printWLine(i32* %13), !dbg !149
  %14 = load i32*, i32** %data, align 8, !dbg !150
  %15 = bitcast i32* %14 to i8*, !dbg !150
  call void @free(i8* %15) #7, !dbg !151
  ret void, !dbg !152
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !153 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !154, metadata !DIExpression()), !dbg !155
  %call = call noalias align 16 i8* @malloc(i64 400) #7, !dbg !156
  %0 = bitcast i8* %call to i32*, !dbg !157
  store i32* %0, i32** %data, align 8, !dbg !158
  %1 = load i32*, i32** %data, align 8, !dbg !159
  %cmp = icmp eq i32* %1, null, !dbg !161
  br i1 %cmp, label %if.then, label %if.end, !dbg !162

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !163
  unreachable, !dbg !163

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !165
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 49) #7, !dbg !166
  %3 = load i32*, i32** %data, align 8, !dbg !167
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !167
  store i32 0, i32* %arrayidx, align 4, !dbg !168
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !169, metadata !DIExpression()), !dbg !171
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !171
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !171
  call void @llvm.dbg.declare(metadata i64* %i, metadata !172, metadata !DIExpression()), !dbg !173
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !174, metadata !DIExpression()), !dbg !175
  %5 = load i32*, i32** %data, align 8, !dbg !176
  %call2 = call i64 @wcslen(i32* %5) #9, !dbg !177
  store i64 %call2, i64* %dataLen, align 8, !dbg !178
  store i64 0, i64* %i, align 8, !dbg !179
  br label %for.cond, !dbg !181

for.cond:                                         ; preds = %for.inc, %if.end
  %6 = load i64, i64* %i, align 8, !dbg !182
  %7 = load i64, i64* %dataLen, align 8, !dbg !184
  %cmp3 = icmp ult i64 %6, %7, !dbg !185
  br i1 %cmp3, label %for.body, label %for.end, !dbg !186

for.body:                                         ; preds = %for.cond
  %8 = load i32*, i32** %data, align 8, !dbg !187
  %9 = load i64, i64* %i, align 8, !dbg !189
  %arrayidx4 = getelementptr inbounds i32, i32* %8, i64 %9, !dbg !187
  %10 = load i32, i32* %arrayidx4, align 4, !dbg !187
  %11 = load i64, i64* %i, align 8, !dbg !190
  %arrayidx5 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %11, !dbg !191
  store i32 %10, i32* %arrayidx5, align 4, !dbg !192
  br label %for.inc, !dbg !193

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !194
  %inc = add i64 %12, 1, !dbg !194
  store i64 %inc, i64* %i, align 8, !dbg !194
  br label %for.cond, !dbg !195, !llvm.loop !196

for.end:                                          ; preds = %for.cond
  %arrayidx6 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !198
  store i32 0, i32* %arrayidx6, align 4, !dbg !199
  %13 = load i32*, i32** %data, align 8, !dbg !200
  call void @printWLine(i32* %13), !dbg !201
  %14 = load i32*, i32** %data, align 8, !dbg !202
  %15 = bitcast i32* %14 to i8*, !dbg !202
  call void @free(i8* %15) #7, !dbg !203
  ret void, !dbg !204
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_15.c", directory: "/root/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_15_bad", scope: !17, file: !17, line: 23, type: !18, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_15.c", directory: "/root/SSE-Assessment")
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
!31 = !DILocation(line: 32, column: 17, scope: !16)
!32 = !DILocation(line: 32, column: 9, scope: !16)
!33 = !DILocation(line: 33, column: 9, scope: !16)
!34 = !DILocation(line: 33, column: 21, scope: !16)
!35 = !DILocalVariable(name: "dest", scope: !36, file: !17, line: 41, type: !37)
!36 = distinct !DILexicalBlock(scope: !16, file: !17, line: 40, column: 5)
!37 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 1600, elements: !38)
!38 = !{!39}
!39 = !DISubrange(count: 50)
!40 = !DILocation(line: 41, column: 17, scope: !36)
!41 = !DILocalVariable(name: "i", scope: !36, file: !17, line: 42, type: !42)
!42 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !6, line: 46, baseType: !43)
!43 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!44 = !DILocation(line: 42, column: 16, scope: !36)
!45 = !DILocalVariable(name: "dataLen", scope: !36, file: !17, line: 42, type: !42)
!46 = !DILocation(line: 42, column: 19, scope: !36)
!47 = !DILocation(line: 43, column: 26, scope: !36)
!48 = !DILocation(line: 43, column: 19, scope: !36)
!49 = !DILocation(line: 43, column: 17, scope: !36)
!50 = !DILocation(line: 45, column: 16, scope: !51)
!51 = distinct !DILexicalBlock(scope: !36, file: !17, line: 45, column: 9)
!52 = !DILocation(line: 45, column: 14, scope: !51)
!53 = !DILocation(line: 45, column: 21, scope: !54)
!54 = distinct !DILexicalBlock(scope: !51, file: !17, line: 45, column: 9)
!55 = !DILocation(line: 45, column: 25, scope: !54)
!56 = !DILocation(line: 45, column: 23, scope: !54)
!57 = !DILocation(line: 45, column: 9, scope: !51)
!58 = !DILocation(line: 47, column: 23, scope: !59)
!59 = distinct !DILexicalBlock(scope: !54, file: !17, line: 46, column: 9)
!60 = !DILocation(line: 47, column: 28, scope: !59)
!61 = !DILocation(line: 47, column: 18, scope: !59)
!62 = !DILocation(line: 47, column: 13, scope: !59)
!63 = !DILocation(line: 47, column: 21, scope: !59)
!64 = !DILocation(line: 48, column: 9, scope: !59)
!65 = !DILocation(line: 45, column: 35, scope: !54)
!66 = !DILocation(line: 45, column: 9, scope: !54)
!67 = distinct !{!67, !57, !68, !69}
!68 = !DILocation(line: 48, column: 9, scope: !51)
!69 = !{!"llvm.loop.mustprogress"}
!70 = !DILocation(line: 49, column: 9, scope: !36)
!71 = !DILocation(line: 49, column: 20, scope: !36)
!72 = !DILocation(line: 50, column: 20, scope: !36)
!73 = !DILocation(line: 50, column: 9, scope: !36)
!74 = !DILocation(line: 51, column: 14, scope: !36)
!75 = !DILocation(line: 51, column: 9, scope: !36)
!76 = !DILocation(line: 53, column: 1, scope: !16)
!77 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_15_good", scope: !17, file: !17, line: 125, type: !18, scopeLine: 126, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!78 = !DILocation(line: 127, column: 5, scope: !77)
!79 = !DILocation(line: 128, column: 5, scope: !77)
!80 = !DILocation(line: 129, column: 1, scope: !77)
!81 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 141, type: !82, scopeLine: 142, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!82 = !DISubroutineType(types: !83)
!83 = !{!7, !7, !84}
!84 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !85, size: 64)
!85 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !86, size: 64)
!86 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!87 = !DILocalVariable(name: "argc", arg: 1, scope: !81, file: !17, line: 141, type: !7)
!88 = !DILocation(line: 141, column: 14, scope: !81)
!89 = !DILocalVariable(name: "argv", arg: 2, scope: !81, file: !17, line: 141, type: !84)
!90 = !DILocation(line: 141, column: 27, scope: !81)
!91 = !DILocation(line: 144, column: 22, scope: !81)
!92 = !DILocation(line: 144, column: 12, scope: !81)
!93 = !DILocation(line: 144, column: 5, scope: !81)
!94 = !DILocation(line: 146, column: 5, scope: !81)
!95 = !DILocation(line: 147, column: 5, scope: !81)
!96 = !DILocation(line: 148, column: 5, scope: !81)
!97 = !DILocation(line: 151, column: 5, scope: !81)
!98 = !DILocation(line: 152, column: 5, scope: !81)
!99 = !DILocation(line: 153, column: 5, scope: !81)
!100 = !DILocation(line: 155, column: 5, scope: !81)
!101 = distinct !DISubprogram(name: "goodG2B1", scope: !17, file: !17, line: 60, type: !18, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!102 = !DILocalVariable(name: "data", scope: !101, file: !17, line: 62, type: !4)
!103 = !DILocation(line: 62, column: 15, scope: !101)
!104 = !DILocation(line: 63, column: 23, scope: !101)
!105 = !DILocation(line: 63, column: 12, scope: !101)
!106 = !DILocation(line: 63, column: 10, scope: !101)
!107 = !DILocation(line: 64, column: 9, scope: !108)
!108 = distinct !DILexicalBlock(scope: !101, file: !17, line: 64, column: 9)
!109 = !DILocation(line: 64, column: 14, scope: !108)
!110 = !DILocation(line: 64, column: 9, scope: !101)
!111 = !DILocation(line: 64, column: 24, scope: !112)
!112 = distinct !DILexicalBlock(scope: !108, file: !17, line: 64, column: 23)
!113 = !DILocation(line: 73, column: 17, scope: !101)
!114 = !DILocation(line: 73, column: 9, scope: !101)
!115 = !DILocation(line: 74, column: 9, scope: !101)
!116 = !DILocation(line: 74, column: 20, scope: !101)
!117 = !DILocalVariable(name: "dest", scope: !118, file: !17, line: 78, type: !37)
!118 = distinct !DILexicalBlock(scope: !101, file: !17, line: 77, column: 5)
!119 = !DILocation(line: 78, column: 17, scope: !118)
!120 = !DILocalVariable(name: "i", scope: !118, file: !17, line: 79, type: !42)
!121 = !DILocation(line: 79, column: 16, scope: !118)
!122 = !DILocalVariable(name: "dataLen", scope: !118, file: !17, line: 79, type: !42)
!123 = !DILocation(line: 79, column: 19, scope: !118)
!124 = !DILocation(line: 80, column: 26, scope: !118)
!125 = !DILocation(line: 80, column: 19, scope: !118)
!126 = !DILocation(line: 80, column: 17, scope: !118)
!127 = !DILocation(line: 82, column: 16, scope: !128)
!128 = distinct !DILexicalBlock(scope: !118, file: !17, line: 82, column: 9)
!129 = !DILocation(line: 82, column: 14, scope: !128)
!130 = !DILocation(line: 82, column: 21, scope: !131)
!131 = distinct !DILexicalBlock(scope: !128, file: !17, line: 82, column: 9)
!132 = !DILocation(line: 82, column: 25, scope: !131)
!133 = !DILocation(line: 82, column: 23, scope: !131)
!134 = !DILocation(line: 82, column: 9, scope: !128)
!135 = !DILocation(line: 84, column: 23, scope: !136)
!136 = distinct !DILexicalBlock(scope: !131, file: !17, line: 83, column: 9)
!137 = !DILocation(line: 84, column: 28, scope: !136)
!138 = !DILocation(line: 84, column: 18, scope: !136)
!139 = !DILocation(line: 84, column: 13, scope: !136)
!140 = !DILocation(line: 84, column: 21, scope: !136)
!141 = !DILocation(line: 85, column: 9, scope: !136)
!142 = !DILocation(line: 82, column: 35, scope: !131)
!143 = !DILocation(line: 82, column: 9, scope: !131)
!144 = distinct !{!144, !134, !145, !69}
!145 = !DILocation(line: 85, column: 9, scope: !128)
!146 = !DILocation(line: 86, column: 9, scope: !118)
!147 = !DILocation(line: 86, column: 20, scope: !118)
!148 = !DILocation(line: 87, column: 20, scope: !118)
!149 = !DILocation(line: 87, column: 9, scope: !118)
!150 = !DILocation(line: 88, column: 14, scope: !118)
!151 = !DILocation(line: 88, column: 9, scope: !118)
!152 = !DILocation(line: 90, column: 1, scope: !101)
!153 = distinct !DISubprogram(name: "goodG2B2", scope: !17, file: !17, line: 93, type: !18, scopeLine: 94, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!154 = !DILocalVariable(name: "data", scope: !153, file: !17, line: 95, type: !4)
!155 = !DILocation(line: 95, column: 15, scope: !153)
!156 = !DILocation(line: 96, column: 23, scope: !153)
!157 = !DILocation(line: 96, column: 12, scope: !153)
!158 = !DILocation(line: 96, column: 10, scope: !153)
!159 = !DILocation(line: 97, column: 9, scope: !160)
!160 = distinct !DILexicalBlock(scope: !153, file: !17, line: 97, column: 9)
!161 = !DILocation(line: 97, column: 14, scope: !160)
!162 = !DILocation(line: 97, column: 9, scope: !153)
!163 = !DILocation(line: 97, column: 24, scope: !164)
!164 = distinct !DILexicalBlock(scope: !160, file: !17, line: 97, column: 23)
!165 = !DILocation(line: 102, column: 17, scope: !153)
!166 = !DILocation(line: 102, column: 9, scope: !153)
!167 = !DILocation(line: 103, column: 9, scope: !153)
!168 = !DILocation(line: 103, column: 20, scope: !153)
!169 = !DILocalVariable(name: "dest", scope: !170, file: !17, line: 111, type: !37)
!170 = distinct !DILexicalBlock(scope: !153, file: !17, line: 110, column: 5)
!171 = !DILocation(line: 111, column: 17, scope: !170)
!172 = !DILocalVariable(name: "i", scope: !170, file: !17, line: 112, type: !42)
!173 = !DILocation(line: 112, column: 16, scope: !170)
!174 = !DILocalVariable(name: "dataLen", scope: !170, file: !17, line: 112, type: !42)
!175 = !DILocation(line: 112, column: 19, scope: !170)
!176 = !DILocation(line: 113, column: 26, scope: !170)
!177 = !DILocation(line: 113, column: 19, scope: !170)
!178 = !DILocation(line: 113, column: 17, scope: !170)
!179 = !DILocation(line: 115, column: 16, scope: !180)
!180 = distinct !DILexicalBlock(scope: !170, file: !17, line: 115, column: 9)
!181 = !DILocation(line: 115, column: 14, scope: !180)
!182 = !DILocation(line: 115, column: 21, scope: !183)
!183 = distinct !DILexicalBlock(scope: !180, file: !17, line: 115, column: 9)
!184 = !DILocation(line: 115, column: 25, scope: !183)
!185 = !DILocation(line: 115, column: 23, scope: !183)
!186 = !DILocation(line: 115, column: 9, scope: !180)
!187 = !DILocation(line: 117, column: 23, scope: !188)
!188 = distinct !DILexicalBlock(scope: !183, file: !17, line: 116, column: 9)
!189 = !DILocation(line: 117, column: 28, scope: !188)
!190 = !DILocation(line: 117, column: 18, scope: !188)
!191 = !DILocation(line: 117, column: 13, scope: !188)
!192 = !DILocation(line: 117, column: 21, scope: !188)
!193 = !DILocation(line: 118, column: 9, scope: !188)
!194 = !DILocation(line: 115, column: 35, scope: !183)
!195 = !DILocation(line: 115, column: 9, scope: !183)
!196 = distinct !{!196, !186, !197, !69}
!197 = !DILocation(line: 118, column: 9, scope: !180)
!198 = !DILocation(line: 119, column: 9, scope: !170)
!199 = !DILocation(line: 119, column: 20, scope: !170)
!200 = !DILocation(line: 120, column: 20, scope: !170)
!201 = !DILocation(line: 120, column: 9, scope: !170)
!202 = !DILocation(line: 121, column: 14, scope: !170)
!203 = !DILocation(line: 121, column: 9, scope: !170)
!204 = !DILocation(line: 123, column: 1, scope: !153)
