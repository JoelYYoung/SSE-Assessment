; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_loop_15.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_loop_15.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_wchar_t_loop_15_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  store i32* null, i32** %data, align 8, !dbg !22
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !23, metadata !DIExpression()), !dbg !25
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !26
  %0 = bitcast i8* %call to i32*, !dbg !27
  store i32* %0, i32** %dataBuffer, align 8, !dbg !25
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !28
  %cmp = icmp eq i32* %1, null, !dbg !30
  br i1 %cmp, label %if.then, label %if.end, !dbg !31

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !32
  unreachable, !dbg !32

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !34
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 99) #5, !dbg !35
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !36
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !36
  store i32 0, i32* %arrayidx, align 4, !dbg !37
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !38
  %add.ptr = getelementptr inbounds i32, i32* %4, i64 -8, !dbg !39
  store i32* %add.ptr, i32** %data, align 8, !dbg !40
  call void @llvm.dbg.declare(metadata i64* %i, metadata !41, metadata !DIExpression()), !dbg !45
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !46, metadata !DIExpression()), !dbg !50
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !51
  %call2 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !52
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !53
  store i32 0, i32* %arrayidx3, align 4, !dbg !54
  store i64 0, i64* %i, align 8, !dbg !55
  br label %for.cond, !dbg !57

for.cond:                                         ; preds = %for.inc, %if.end
  %5 = load i64, i64* %i, align 8, !dbg !58
  %cmp4 = icmp ult i64 %5, 100, !dbg !60
  br i1 %cmp4, label %for.body, label %for.end, !dbg !61

for.body:                                         ; preds = %for.cond
  %6 = load i32*, i32** %data, align 8, !dbg !62
  %7 = load i64, i64* %i, align 8, !dbg !64
  %arrayidx5 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !62
  %8 = load i32, i32* %arrayidx5, align 4, !dbg !62
  %9 = load i64, i64* %i, align 8, !dbg !65
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %9, !dbg !66
  store i32 %8, i32* %arrayidx6, align 4, !dbg !67
  br label %for.inc, !dbg !68

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !69
  %inc = add i64 %10, 1, !dbg !69
  store i64 %inc, i64* %i, align 8, !dbg !69
  br label %for.cond, !dbg !70, !llvm.loop !71

for.end:                                          ; preds = %for.cond
  %arrayidx7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !74
  store i32 0, i32* %arrayidx7, align 4, !dbg !75
  %arraydecay8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !76
  call void @printWLine(i32* %arraydecay8), !dbg !77
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

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_wchar_t_loop_15_good() #0 !dbg !79 {
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
  %call = call i64 @time(i64* null) #5, !dbg !93
  %conv = trunc i64 %call to i32, !dbg !94
  call void @srand(i32 %conv) #5, !dbg !95
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !96
  call void @CWE127_Buffer_Underread__malloc_wchar_t_loop_15_good(), !dbg !97
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !98
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !99
  call void @CWE127_Buffer_Underread__malloc_wchar_t_loop_15_bad(), !dbg !100
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !101
  ret i32 0, !dbg !102
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !103 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !104, metadata !DIExpression()), !dbg !105
  store i32* null, i32** %data, align 8, !dbg !106
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !107, metadata !DIExpression()), !dbg !109
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !110
  %0 = bitcast i8* %call to i32*, !dbg !111
  store i32* %0, i32** %dataBuffer, align 8, !dbg !109
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !112
  %cmp = icmp eq i32* %1, null, !dbg !114
  br i1 %cmp, label %if.then, label %if.end, !dbg !115

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !116
  unreachable, !dbg !116

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !118
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 99) #5, !dbg !119
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !120
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !120
  store i32 0, i32* %arrayidx, align 4, !dbg !121
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !122
  store i32* %4, i32** %data, align 8, !dbg !123
  call void @llvm.dbg.declare(metadata i64* %i, metadata !124, metadata !DIExpression()), !dbg !126
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !127, metadata !DIExpression()), !dbg !128
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !129
  %call2 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !130
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !131
  store i32 0, i32* %arrayidx3, align 4, !dbg !132
  store i64 0, i64* %i, align 8, !dbg !133
  br label %for.cond, !dbg !135

for.cond:                                         ; preds = %for.inc, %if.end
  %5 = load i64, i64* %i, align 8, !dbg !136
  %cmp4 = icmp ult i64 %5, 100, !dbg !138
  br i1 %cmp4, label %for.body, label %for.end, !dbg !139

for.body:                                         ; preds = %for.cond
  %6 = load i32*, i32** %data, align 8, !dbg !140
  %7 = load i64, i64* %i, align 8, !dbg !142
  %arrayidx5 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !140
  %8 = load i32, i32* %arrayidx5, align 4, !dbg !140
  %9 = load i64, i64* %i, align 8, !dbg !143
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %9, !dbg !144
  store i32 %8, i32* %arrayidx6, align 4, !dbg !145
  br label %for.inc, !dbg !146

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !147
  %inc = add i64 %10, 1, !dbg !147
  store i64 %inc, i64* %i, align 8, !dbg !147
  br label %for.cond, !dbg !148, !llvm.loop !149

for.end:                                          ; preds = %for.cond
  %arrayidx7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !151
  store i32 0, i32* %arrayidx7, align 4, !dbg !152
  %arraydecay8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !153
  call void @printWLine(i32* %arraydecay8), !dbg !154
  ret void, !dbg !155
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !156 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !157, metadata !DIExpression()), !dbg !158
  store i32* null, i32** %data, align 8, !dbg !159
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !160, metadata !DIExpression()), !dbg !162
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !163
  %0 = bitcast i8* %call to i32*, !dbg !164
  store i32* %0, i32** %dataBuffer, align 8, !dbg !162
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !165
  %cmp = icmp eq i32* %1, null, !dbg !167
  br i1 %cmp, label %if.then, label %if.end, !dbg !168

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !169
  unreachable, !dbg !169

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !171
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 99) #5, !dbg !172
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !173
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !173
  store i32 0, i32* %arrayidx, align 4, !dbg !174
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !175
  store i32* %4, i32** %data, align 8, !dbg !176
  call void @llvm.dbg.declare(metadata i64* %i, metadata !177, metadata !DIExpression()), !dbg !179
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !180, metadata !DIExpression()), !dbg !181
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !182
  %call2 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !183
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !184
  store i32 0, i32* %arrayidx3, align 4, !dbg !185
  store i64 0, i64* %i, align 8, !dbg !186
  br label %for.cond, !dbg !188

for.cond:                                         ; preds = %for.inc, %if.end
  %5 = load i64, i64* %i, align 8, !dbg !189
  %cmp4 = icmp ult i64 %5, 100, !dbg !191
  br i1 %cmp4, label %for.body, label %for.end, !dbg !192

for.body:                                         ; preds = %for.cond
  %6 = load i32*, i32** %data, align 8, !dbg !193
  %7 = load i64, i64* %i, align 8, !dbg !195
  %arrayidx5 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !193
  %8 = load i32, i32* %arrayidx5, align 4, !dbg !193
  %9 = load i64, i64* %i, align 8, !dbg !196
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %9, !dbg !197
  store i32 %8, i32* %arrayidx6, align 4, !dbg !198
  br label %for.inc, !dbg !199

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !200
  %inc = add i64 %10, 1, !dbg !200
  store i64 %inc, i64* %i, align 8, !dbg !200
  br label %for.cond, !dbg !201, !llvm.loop !202

for.end:                                          ; preds = %for.cond
  %arrayidx7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !204
  store i32 0, i32* %arrayidx7, align 4, !dbg !205
  %arraydecay8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !206
  call void @printWLine(i32* %arraydecay8), !dbg !207
  ret void, !dbg !208
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_loop_15.c", directory: "/home/joelyang/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_wchar_t_loop_15_bad", scope: !17, file: !17, line: 23, type: !18, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_loop_15.c", directory: "/home/joelyang/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 25, type: !4)
!21 = !DILocation(line: 25, column: 15, scope: !16)
!22 = !DILocation(line: 26, column: 10, scope: !16)
!23 = !DILocalVariable(name: "dataBuffer", scope: !24, file: !17, line: 31, type: !4)
!24 = distinct !DILexicalBlock(scope: !16, file: !17, line: 30, column: 5)
!25 = !DILocation(line: 31, column: 19, scope: !24)
!26 = !DILocation(line: 31, column: 43, scope: !24)
!27 = !DILocation(line: 31, column: 32, scope: !24)
!28 = !DILocation(line: 32, column: 13, scope: !29)
!29 = distinct !DILexicalBlock(scope: !24, file: !17, line: 32, column: 13)
!30 = !DILocation(line: 32, column: 24, scope: !29)
!31 = !DILocation(line: 32, column: 13, scope: !24)
!32 = !DILocation(line: 32, column: 34, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !17, line: 32, column: 33)
!34 = !DILocation(line: 33, column: 17, scope: !24)
!35 = !DILocation(line: 33, column: 9, scope: !24)
!36 = !DILocation(line: 34, column: 9, scope: !24)
!37 = !DILocation(line: 34, column: 27, scope: !24)
!38 = !DILocation(line: 36, column: 16, scope: !24)
!39 = !DILocation(line: 36, column: 27, scope: !24)
!40 = !DILocation(line: 36, column: 14, scope: !24)
!41 = !DILocalVariable(name: "i", scope: !42, file: !17, line: 45, type: !43)
!42 = distinct !DILexicalBlock(scope: !16, file: !17, line: 44, column: 5)
!43 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !6, line: 46, baseType: !44)
!44 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!45 = !DILocation(line: 45, column: 16, scope: !42)
!46 = !DILocalVariable(name: "dest", scope: !42, file: !17, line: 46, type: !47)
!47 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !48)
!48 = !{!49}
!49 = !DISubrange(count: 100)
!50 = !DILocation(line: 46, column: 17, scope: !42)
!51 = !DILocation(line: 47, column: 17, scope: !42)
!52 = !DILocation(line: 47, column: 9, scope: !42)
!53 = !DILocation(line: 48, column: 9, scope: !42)
!54 = !DILocation(line: 48, column: 21, scope: !42)
!55 = !DILocation(line: 50, column: 16, scope: !56)
!56 = distinct !DILexicalBlock(scope: !42, file: !17, line: 50, column: 9)
!57 = !DILocation(line: 50, column: 14, scope: !56)
!58 = !DILocation(line: 50, column: 21, scope: !59)
!59 = distinct !DILexicalBlock(scope: !56, file: !17, line: 50, column: 9)
!60 = !DILocation(line: 50, column: 23, scope: !59)
!61 = !DILocation(line: 50, column: 9, scope: !56)
!62 = !DILocation(line: 52, column: 23, scope: !63)
!63 = distinct !DILexicalBlock(scope: !59, file: !17, line: 51, column: 9)
!64 = !DILocation(line: 52, column: 28, scope: !63)
!65 = !DILocation(line: 52, column: 18, scope: !63)
!66 = !DILocation(line: 52, column: 13, scope: !63)
!67 = !DILocation(line: 52, column: 21, scope: !63)
!68 = !DILocation(line: 53, column: 9, scope: !63)
!69 = !DILocation(line: 50, column: 31, scope: !59)
!70 = !DILocation(line: 50, column: 9, scope: !59)
!71 = distinct !{!71, !61, !72, !73}
!72 = !DILocation(line: 53, column: 9, scope: !56)
!73 = !{!"llvm.loop.mustprogress"}
!74 = !DILocation(line: 55, column: 9, scope: !42)
!75 = !DILocation(line: 55, column: 21, scope: !42)
!76 = !DILocation(line: 56, column: 20, scope: !42)
!77 = !DILocation(line: 56, column: 9, scope: !42)
!78 = !DILocation(line: 60, column: 1, scope: !16)
!79 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_wchar_t_loop_15_good", scope: !17, file: !17, line: 146, type: !18, scopeLine: 147, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!80 = !DILocation(line: 148, column: 5, scope: !79)
!81 = !DILocation(line: 149, column: 5, scope: !79)
!82 = !DILocation(line: 150, column: 1, scope: !79)
!83 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 162, type: !84, scopeLine: 163, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!84 = !DISubroutineType(types: !85)
!85 = !{!7, !7, !86}
!86 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !87, size: 64)
!87 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !88, size: 64)
!88 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!89 = !DILocalVariable(name: "argc", arg: 1, scope: !83, file: !17, line: 162, type: !7)
!90 = !DILocation(line: 162, column: 14, scope: !83)
!91 = !DILocalVariable(name: "argv", arg: 2, scope: !83, file: !17, line: 162, type: !86)
!92 = !DILocation(line: 162, column: 27, scope: !83)
!93 = !DILocation(line: 165, column: 22, scope: !83)
!94 = !DILocation(line: 165, column: 12, scope: !83)
!95 = !DILocation(line: 165, column: 5, scope: !83)
!96 = !DILocation(line: 167, column: 5, scope: !83)
!97 = !DILocation(line: 168, column: 5, scope: !83)
!98 = !DILocation(line: 169, column: 5, scope: !83)
!99 = !DILocation(line: 172, column: 5, scope: !83)
!100 = !DILocation(line: 173, column: 5, scope: !83)
!101 = !DILocation(line: 174, column: 5, scope: !83)
!102 = !DILocation(line: 176, column: 5, scope: !83)
!103 = distinct !DISubprogram(name: "goodG2B1", scope: !17, file: !17, line: 67, type: !18, scopeLine: 68, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!104 = !DILocalVariable(name: "data", scope: !103, file: !17, line: 69, type: !4)
!105 = !DILocation(line: 69, column: 15, scope: !103)
!106 = !DILocation(line: 70, column: 10, scope: !103)
!107 = !DILocalVariable(name: "dataBuffer", scope: !108, file: !17, line: 79, type: !4)
!108 = distinct !DILexicalBlock(scope: !103, file: !17, line: 78, column: 5)
!109 = !DILocation(line: 79, column: 19, scope: !108)
!110 = !DILocation(line: 79, column: 43, scope: !108)
!111 = !DILocation(line: 79, column: 32, scope: !108)
!112 = !DILocation(line: 80, column: 13, scope: !113)
!113 = distinct !DILexicalBlock(scope: !108, file: !17, line: 80, column: 13)
!114 = !DILocation(line: 80, column: 24, scope: !113)
!115 = !DILocation(line: 80, column: 13, scope: !108)
!116 = !DILocation(line: 80, column: 34, scope: !117)
!117 = distinct !DILexicalBlock(scope: !113, file: !17, line: 80, column: 33)
!118 = !DILocation(line: 81, column: 17, scope: !108)
!119 = !DILocation(line: 81, column: 9, scope: !108)
!120 = !DILocation(line: 82, column: 9, scope: !108)
!121 = !DILocation(line: 82, column: 27, scope: !108)
!122 = !DILocation(line: 84, column: 16, scope: !108)
!123 = !DILocation(line: 84, column: 14, scope: !108)
!124 = !DILocalVariable(name: "i", scope: !125, file: !17, line: 89, type: !43)
!125 = distinct !DILexicalBlock(scope: !103, file: !17, line: 88, column: 5)
!126 = !DILocation(line: 89, column: 16, scope: !125)
!127 = !DILocalVariable(name: "dest", scope: !125, file: !17, line: 90, type: !47)
!128 = !DILocation(line: 90, column: 17, scope: !125)
!129 = !DILocation(line: 91, column: 17, scope: !125)
!130 = !DILocation(line: 91, column: 9, scope: !125)
!131 = !DILocation(line: 92, column: 9, scope: !125)
!132 = !DILocation(line: 92, column: 21, scope: !125)
!133 = !DILocation(line: 94, column: 16, scope: !134)
!134 = distinct !DILexicalBlock(scope: !125, file: !17, line: 94, column: 9)
!135 = !DILocation(line: 94, column: 14, scope: !134)
!136 = !DILocation(line: 94, column: 21, scope: !137)
!137 = distinct !DILexicalBlock(scope: !134, file: !17, line: 94, column: 9)
!138 = !DILocation(line: 94, column: 23, scope: !137)
!139 = !DILocation(line: 94, column: 9, scope: !134)
!140 = !DILocation(line: 96, column: 23, scope: !141)
!141 = distinct !DILexicalBlock(scope: !137, file: !17, line: 95, column: 9)
!142 = !DILocation(line: 96, column: 28, scope: !141)
!143 = !DILocation(line: 96, column: 18, scope: !141)
!144 = !DILocation(line: 96, column: 13, scope: !141)
!145 = !DILocation(line: 96, column: 21, scope: !141)
!146 = !DILocation(line: 97, column: 9, scope: !141)
!147 = !DILocation(line: 94, column: 31, scope: !137)
!148 = !DILocation(line: 94, column: 9, scope: !137)
!149 = distinct !{!149, !139, !150, !73}
!150 = !DILocation(line: 97, column: 9, scope: !134)
!151 = !DILocation(line: 99, column: 9, scope: !125)
!152 = !DILocation(line: 99, column: 21, scope: !125)
!153 = !DILocation(line: 100, column: 20, scope: !125)
!154 = !DILocation(line: 100, column: 9, scope: !125)
!155 = !DILocation(line: 104, column: 1, scope: !103)
!156 = distinct !DISubprogram(name: "goodG2B2", scope: !17, file: !17, line: 107, type: !18, scopeLine: 108, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!157 = !DILocalVariable(name: "data", scope: !156, file: !17, line: 109, type: !4)
!158 = !DILocation(line: 109, column: 15, scope: !156)
!159 = !DILocation(line: 110, column: 10, scope: !156)
!160 = !DILocalVariable(name: "dataBuffer", scope: !161, file: !17, line: 115, type: !4)
!161 = distinct !DILexicalBlock(scope: !156, file: !17, line: 114, column: 5)
!162 = !DILocation(line: 115, column: 19, scope: !161)
!163 = !DILocation(line: 115, column: 43, scope: !161)
!164 = !DILocation(line: 115, column: 32, scope: !161)
!165 = !DILocation(line: 116, column: 13, scope: !166)
!166 = distinct !DILexicalBlock(scope: !161, file: !17, line: 116, column: 13)
!167 = !DILocation(line: 116, column: 24, scope: !166)
!168 = !DILocation(line: 116, column: 13, scope: !161)
!169 = !DILocation(line: 116, column: 34, scope: !170)
!170 = distinct !DILexicalBlock(scope: !166, file: !17, line: 116, column: 33)
!171 = !DILocation(line: 117, column: 17, scope: !161)
!172 = !DILocation(line: 117, column: 9, scope: !161)
!173 = !DILocation(line: 118, column: 9, scope: !161)
!174 = !DILocation(line: 118, column: 27, scope: !161)
!175 = !DILocation(line: 120, column: 16, scope: !161)
!176 = !DILocation(line: 120, column: 14, scope: !161)
!177 = !DILocalVariable(name: "i", scope: !178, file: !17, line: 129, type: !43)
!178 = distinct !DILexicalBlock(scope: !156, file: !17, line: 128, column: 5)
!179 = !DILocation(line: 129, column: 16, scope: !178)
!180 = !DILocalVariable(name: "dest", scope: !178, file: !17, line: 130, type: !47)
!181 = !DILocation(line: 130, column: 17, scope: !178)
!182 = !DILocation(line: 131, column: 17, scope: !178)
!183 = !DILocation(line: 131, column: 9, scope: !178)
!184 = !DILocation(line: 132, column: 9, scope: !178)
!185 = !DILocation(line: 132, column: 21, scope: !178)
!186 = !DILocation(line: 134, column: 16, scope: !187)
!187 = distinct !DILexicalBlock(scope: !178, file: !17, line: 134, column: 9)
!188 = !DILocation(line: 134, column: 14, scope: !187)
!189 = !DILocation(line: 134, column: 21, scope: !190)
!190 = distinct !DILexicalBlock(scope: !187, file: !17, line: 134, column: 9)
!191 = !DILocation(line: 134, column: 23, scope: !190)
!192 = !DILocation(line: 134, column: 9, scope: !187)
!193 = !DILocation(line: 136, column: 23, scope: !194)
!194 = distinct !DILexicalBlock(scope: !190, file: !17, line: 135, column: 9)
!195 = !DILocation(line: 136, column: 28, scope: !194)
!196 = !DILocation(line: 136, column: 18, scope: !194)
!197 = !DILocation(line: 136, column: 13, scope: !194)
!198 = !DILocation(line: 136, column: 21, scope: !194)
!199 = !DILocation(line: 137, column: 9, scope: !194)
!200 = !DILocation(line: 134, column: 31, scope: !190)
!201 = !DILocation(line: 134, column: 9, scope: !190)
!202 = distinct !{!202, !192, !203, !73}
!203 = !DILocation(line: 137, column: 9, scope: !187)
!204 = !DILocation(line: 139, column: 9, scope: !178)
!205 = !DILocation(line: 139, column: 21, scope: !178)
!206 = !DILocation(line: 140, column: 20, scope: !178)
!207 = !DILocation(line: 140, column: 9, scope: !178)
!208 = !DILocation(line: 144, column: 1, scope: !156)
