; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_loop_32.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_loop_32.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_wchar_t_loop_32_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %dataPtr1 = alloca i32**, align 8
  %dataPtr2 = alloca i32**, align 8
  %data1 = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %data3 = alloca i32*, align 8
  %i = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata i32*** %dataPtr1, metadata !22, metadata !DIExpression()), !dbg !24
  store i32** %data, i32*** %dataPtr1, align 8, !dbg !24
  call void @llvm.dbg.declare(metadata i32*** %dataPtr2, metadata !25, metadata !DIExpression()), !dbg !26
  store i32** %data, i32*** %dataPtr2, align 8, !dbg !26
  store i32* null, i32** %data, align 8, !dbg !27
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !28, metadata !DIExpression()), !dbg !30
  %0 = load i32**, i32*** %dataPtr1, align 8, !dbg !31
  %1 = load i32*, i32** %0, align 8, !dbg !32
  store i32* %1, i32** %data1, align 8, !dbg !30
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !33, metadata !DIExpression()), !dbg !35
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !36
  %2 = bitcast i8* %call to i32*, !dbg !37
  store i32* %2, i32** %dataBuffer, align 8, !dbg !35
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !38
  %cmp = icmp eq i32* %3, null, !dbg !40
  br i1 %cmp, label %if.then, label %if.end, !dbg !41

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !42
  unreachable, !dbg !42

if.end:                                           ; preds = %entry
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !44
  %call2 = call i32* @wmemset(i32* %4, i32 65, i64 99) #5, !dbg !45
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !46
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 99, !dbg !46
  store i32 0, i32* %arrayidx, align 4, !dbg !47
  %6 = load i32*, i32** %dataBuffer, align 8, !dbg !48
  %add.ptr = getelementptr inbounds i32, i32* %6, i64 -8, !dbg !49
  store i32* %add.ptr, i32** %data1, align 8, !dbg !50
  %7 = load i32*, i32** %data1, align 8, !dbg !51
  %8 = load i32**, i32*** %dataPtr1, align 8, !dbg !52
  store i32* %7, i32** %8, align 8, !dbg !53
  call void @llvm.dbg.declare(metadata i32** %data3, metadata !54, metadata !DIExpression()), !dbg !56
  %9 = load i32**, i32*** %dataPtr2, align 8, !dbg !57
  %10 = load i32*, i32** %9, align 8, !dbg !58
  store i32* %10, i32** %data3, align 8, !dbg !56
  call void @llvm.dbg.declare(metadata i64* %i, metadata !59, metadata !DIExpression()), !dbg !63
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !64, metadata !DIExpression()), !dbg !68
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !69
  %call4 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !70
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !71
  store i32 0, i32* %arrayidx5, align 4, !dbg !72
  store i64 0, i64* %i, align 8, !dbg !73
  br label %for.cond, !dbg !75

for.cond:                                         ; preds = %for.inc, %if.end
  %11 = load i64, i64* %i, align 8, !dbg !76
  %cmp6 = icmp ult i64 %11, 100, !dbg !78
  br i1 %cmp6, label %for.body, label %for.end, !dbg !79

for.body:                                         ; preds = %for.cond
  %12 = load i32*, i32** %data3, align 8, !dbg !80
  %13 = load i64, i64* %i, align 8, !dbg !82
  %arrayidx7 = getelementptr inbounds i32, i32* %12, i64 %13, !dbg !80
  %14 = load i32, i32* %arrayidx7, align 4, !dbg !80
  %15 = load i64, i64* %i, align 8, !dbg !83
  %arrayidx8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %15, !dbg !84
  store i32 %14, i32* %arrayidx8, align 4, !dbg !85
  br label %for.inc, !dbg !86

for.inc:                                          ; preds = %for.body
  %16 = load i64, i64* %i, align 8, !dbg !87
  %inc = add i64 %16, 1, !dbg !87
  store i64 %inc, i64* %i, align 8, !dbg !87
  br label %for.cond, !dbg !88, !llvm.loop !89

for.end:                                          ; preds = %for.cond
  %arrayidx9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !92
  store i32 0, i32* %arrayidx9, align 4, !dbg !93
  %arraydecay10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !94
  call void @printWLine(i32* %arraydecay10), !dbg !95
  ret void, !dbg !96
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
define dso_local void @CWE127_Buffer_Underread__malloc_wchar_t_loop_32_good() #0 !dbg !97 {
entry:
  call void @goodG2B(), !dbg !98
  ret void, !dbg !99
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !100 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !106, metadata !DIExpression()), !dbg !107
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !108, metadata !DIExpression()), !dbg !109
  %call = call i64 @time(i64* null) #5, !dbg !110
  %conv = trunc i64 %call to i32, !dbg !111
  call void @srand(i32 %conv) #5, !dbg !112
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !113
  call void @CWE127_Buffer_Underread__malloc_wchar_t_loop_32_good(), !dbg !114
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !115
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !116
  call void @CWE127_Buffer_Underread__malloc_wchar_t_loop_32_bad(), !dbg !117
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !118
  ret i32 0, !dbg !119
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !120 {
entry:
  %data = alloca i32*, align 8
  %dataPtr1 = alloca i32**, align 8
  %dataPtr2 = alloca i32**, align 8
  %data1 = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %data3 = alloca i32*, align 8
  %i = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !121, metadata !DIExpression()), !dbg !122
  call void @llvm.dbg.declare(metadata i32*** %dataPtr1, metadata !123, metadata !DIExpression()), !dbg !124
  store i32** %data, i32*** %dataPtr1, align 8, !dbg !124
  call void @llvm.dbg.declare(metadata i32*** %dataPtr2, metadata !125, metadata !DIExpression()), !dbg !126
  store i32** %data, i32*** %dataPtr2, align 8, !dbg !126
  store i32* null, i32** %data, align 8, !dbg !127
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !128, metadata !DIExpression()), !dbg !130
  %0 = load i32**, i32*** %dataPtr1, align 8, !dbg !131
  %1 = load i32*, i32** %0, align 8, !dbg !132
  store i32* %1, i32** %data1, align 8, !dbg !130
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !133, metadata !DIExpression()), !dbg !135
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !136
  %2 = bitcast i8* %call to i32*, !dbg !137
  store i32* %2, i32** %dataBuffer, align 8, !dbg !135
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !138
  %cmp = icmp eq i32* %3, null, !dbg !140
  br i1 %cmp, label %if.then, label %if.end, !dbg !141

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !142
  unreachable, !dbg !142

if.end:                                           ; preds = %entry
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !144
  %call2 = call i32* @wmemset(i32* %4, i32 65, i64 99) #5, !dbg !145
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !146
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 99, !dbg !146
  store i32 0, i32* %arrayidx, align 4, !dbg !147
  %6 = load i32*, i32** %dataBuffer, align 8, !dbg !148
  store i32* %6, i32** %data1, align 8, !dbg !149
  %7 = load i32*, i32** %data1, align 8, !dbg !150
  %8 = load i32**, i32*** %dataPtr1, align 8, !dbg !151
  store i32* %7, i32** %8, align 8, !dbg !152
  call void @llvm.dbg.declare(metadata i32** %data3, metadata !153, metadata !DIExpression()), !dbg !155
  %9 = load i32**, i32*** %dataPtr2, align 8, !dbg !156
  %10 = load i32*, i32** %9, align 8, !dbg !157
  store i32* %10, i32** %data3, align 8, !dbg !155
  call void @llvm.dbg.declare(metadata i64* %i, metadata !158, metadata !DIExpression()), !dbg !160
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !161, metadata !DIExpression()), !dbg !162
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !163
  %call4 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !164
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !165
  store i32 0, i32* %arrayidx5, align 4, !dbg !166
  store i64 0, i64* %i, align 8, !dbg !167
  br label %for.cond, !dbg !169

for.cond:                                         ; preds = %for.inc, %if.end
  %11 = load i64, i64* %i, align 8, !dbg !170
  %cmp6 = icmp ult i64 %11, 100, !dbg !172
  br i1 %cmp6, label %for.body, label %for.end, !dbg !173

for.body:                                         ; preds = %for.cond
  %12 = load i32*, i32** %data3, align 8, !dbg !174
  %13 = load i64, i64* %i, align 8, !dbg !176
  %arrayidx7 = getelementptr inbounds i32, i32* %12, i64 %13, !dbg !174
  %14 = load i32, i32* %arrayidx7, align 4, !dbg !174
  %15 = load i64, i64* %i, align 8, !dbg !177
  %arrayidx8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %15, !dbg !178
  store i32 %14, i32* %arrayidx8, align 4, !dbg !179
  br label %for.inc, !dbg !180

for.inc:                                          ; preds = %for.body
  %16 = load i64, i64* %i, align 8, !dbg !181
  %inc = add i64 %16, 1, !dbg !181
  store i64 %inc, i64* %i, align 8, !dbg !181
  br label %for.cond, !dbg !182, !llvm.loop !183

for.end:                                          ; preds = %for.cond
  %arrayidx9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !185
  store i32 0, i32* %arrayidx9, align 4, !dbg !186
  %arraydecay10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !187
  call void @printWLine(i32* %arraydecay10), !dbg !188
  ret void, !dbg !189
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_loop_32.c", directory: "/home/joelyang/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_wchar_t_loop_32_bad", scope: !17, file: !17, line: 23, type: !18, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_loop_32.c", directory: "/home/joelyang/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 25, type: !4)
!21 = !DILocation(line: 25, column: 15, scope: !16)
!22 = !DILocalVariable(name: "dataPtr1", scope: !16, file: !17, line: 26, type: !23)
!23 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!24 = !DILocation(line: 26, column: 16, scope: !16)
!25 = !DILocalVariable(name: "dataPtr2", scope: !16, file: !17, line: 27, type: !23)
!26 = !DILocation(line: 27, column: 16, scope: !16)
!27 = !DILocation(line: 28, column: 10, scope: !16)
!28 = !DILocalVariable(name: "data", scope: !29, file: !17, line: 30, type: !4)
!29 = distinct !DILexicalBlock(scope: !16, file: !17, line: 29, column: 5)
!30 = !DILocation(line: 30, column: 19, scope: !29)
!31 = !DILocation(line: 30, column: 27, scope: !29)
!32 = !DILocation(line: 30, column: 26, scope: !29)
!33 = !DILocalVariable(name: "dataBuffer", scope: !34, file: !17, line: 32, type: !4)
!34 = distinct !DILexicalBlock(scope: !29, file: !17, line: 31, column: 9)
!35 = !DILocation(line: 32, column: 23, scope: !34)
!36 = !DILocation(line: 32, column: 47, scope: !34)
!37 = !DILocation(line: 32, column: 36, scope: !34)
!38 = !DILocation(line: 33, column: 17, scope: !39)
!39 = distinct !DILexicalBlock(scope: !34, file: !17, line: 33, column: 17)
!40 = !DILocation(line: 33, column: 28, scope: !39)
!41 = !DILocation(line: 33, column: 17, scope: !34)
!42 = !DILocation(line: 33, column: 38, scope: !43)
!43 = distinct !DILexicalBlock(scope: !39, file: !17, line: 33, column: 37)
!44 = !DILocation(line: 34, column: 21, scope: !34)
!45 = !DILocation(line: 34, column: 13, scope: !34)
!46 = !DILocation(line: 35, column: 13, scope: !34)
!47 = !DILocation(line: 35, column: 31, scope: !34)
!48 = !DILocation(line: 37, column: 20, scope: !34)
!49 = !DILocation(line: 37, column: 31, scope: !34)
!50 = !DILocation(line: 37, column: 18, scope: !34)
!51 = !DILocation(line: 39, column: 21, scope: !29)
!52 = !DILocation(line: 39, column: 10, scope: !29)
!53 = !DILocation(line: 39, column: 19, scope: !29)
!54 = !DILocalVariable(name: "data", scope: !55, file: !17, line: 42, type: !4)
!55 = distinct !DILexicalBlock(scope: !16, file: !17, line: 41, column: 5)
!56 = !DILocation(line: 42, column: 19, scope: !55)
!57 = !DILocation(line: 42, column: 27, scope: !55)
!58 = !DILocation(line: 42, column: 26, scope: !55)
!59 = !DILocalVariable(name: "i", scope: !60, file: !17, line: 44, type: !61)
!60 = distinct !DILexicalBlock(scope: !55, file: !17, line: 43, column: 9)
!61 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !6, line: 46, baseType: !62)
!62 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!63 = !DILocation(line: 44, column: 20, scope: !60)
!64 = !DILocalVariable(name: "dest", scope: !60, file: !17, line: 45, type: !65)
!65 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !66)
!66 = !{!67}
!67 = !DISubrange(count: 100)
!68 = !DILocation(line: 45, column: 21, scope: !60)
!69 = !DILocation(line: 46, column: 21, scope: !60)
!70 = !DILocation(line: 46, column: 13, scope: !60)
!71 = !DILocation(line: 47, column: 13, scope: !60)
!72 = !DILocation(line: 47, column: 25, scope: !60)
!73 = !DILocation(line: 49, column: 20, scope: !74)
!74 = distinct !DILexicalBlock(scope: !60, file: !17, line: 49, column: 13)
!75 = !DILocation(line: 49, column: 18, scope: !74)
!76 = !DILocation(line: 49, column: 25, scope: !77)
!77 = distinct !DILexicalBlock(scope: !74, file: !17, line: 49, column: 13)
!78 = !DILocation(line: 49, column: 27, scope: !77)
!79 = !DILocation(line: 49, column: 13, scope: !74)
!80 = !DILocation(line: 51, column: 27, scope: !81)
!81 = distinct !DILexicalBlock(scope: !77, file: !17, line: 50, column: 13)
!82 = !DILocation(line: 51, column: 32, scope: !81)
!83 = !DILocation(line: 51, column: 22, scope: !81)
!84 = !DILocation(line: 51, column: 17, scope: !81)
!85 = !DILocation(line: 51, column: 25, scope: !81)
!86 = !DILocation(line: 52, column: 13, scope: !81)
!87 = !DILocation(line: 49, column: 35, scope: !77)
!88 = !DILocation(line: 49, column: 13, scope: !77)
!89 = distinct !{!89, !79, !90, !91}
!90 = !DILocation(line: 52, column: 13, scope: !74)
!91 = !{!"llvm.loop.mustprogress"}
!92 = !DILocation(line: 54, column: 13, scope: !60)
!93 = !DILocation(line: 54, column: 25, scope: !60)
!94 = !DILocation(line: 55, column: 24, scope: !60)
!95 = !DILocation(line: 55, column: 13, scope: !60)
!96 = !DILocation(line: 60, column: 1, scope: !16)
!97 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_wchar_t_loop_32_good", scope: !17, file: !17, line: 106, type: !18, scopeLine: 107, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!98 = !DILocation(line: 108, column: 5, scope: !97)
!99 = !DILocation(line: 109, column: 1, scope: !97)
!100 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 120, type: !101, scopeLine: 121, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!101 = !DISubroutineType(types: !102)
!102 = !{!7, !7, !103}
!103 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !104, size: 64)
!104 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !105, size: 64)
!105 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!106 = !DILocalVariable(name: "argc", arg: 1, scope: !100, file: !17, line: 120, type: !7)
!107 = !DILocation(line: 120, column: 14, scope: !100)
!108 = !DILocalVariable(name: "argv", arg: 2, scope: !100, file: !17, line: 120, type: !103)
!109 = !DILocation(line: 120, column: 27, scope: !100)
!110 = !DILocation(line: 123, column: 22, scope: !100)
!111 = !DILocation(line: 123, column: 12, scope: !100)
!112 = !DILocation(line: 123, column: 5, scope: !100)
!113 = !DILocation(line: 125, column: 5, scope: !100)
!114 = !DILocation(line: 126, column: 5, scope: !100)
!115 = !DILocation(line: 127, column: 5, scope: !100)
!116 = !DILocation(line: 130, column: 5, scope: !100)
!117 = !DILocation(line: 131, column: 5, scope: !100)
!118 = !DILocation(line: 132, column: 5, scope: !100)
!119 = !DILocation(line: 134, column: 5, scope: !100)
!120 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 67, type: !18, scopeLine: 68, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!121 = !DILocalVariable(name: "data", scope: !120, file: !17, line: 69, type: !4)
!122 = !DILocation(line: 69, column: 15, scope: !120)
!123 = !DILocalVariable(name: "dataPtr1", scope: !120, file: !17, line: 70, type: !23)
!124 = !DILocation(line: 70, column: 16, scope: !120)
!125 = !DILocalVariable(name: "dataPtr2", scope: !120, file: !17, line: 71, type: !23)
!126 = !DILocation(line: 71, column: 16, scope: !120)
!127 = !DILocation(line: 72, column: 10, scope: !120)
!128 = !DILocalVariable(name: "data", scope: !129, file: !17, line: 74, type: !4)
!129 = distinct !DILexicalBlock(scope: !120, file: !17, line: 73, column: 5)
!130 = !DILocation(line: 74, column: 19, scope: !129)
!131 = !DILocation(line: 74, column: 27, scope: !129)
!132 = !DILocation(line: 74, column: 26, scope: !129)
!133 = !DILocalVariable(name: "dataBuffer", scope: !134, file: !17, line: 76, type: !4)
!134 = distinct !DILexicalBlock(scope: !129, file: !17, line: 75, column: 9)
!135 = !DILocation(line: 76, column: 23, scope: !134)
!136 = !DILocation(line: 76, column: 47, scope: !134)
!137 = !DILocation(line: 76, column: 36, scope: !134)
!138 = !DILocation(line: 77, column: 17, scope: !139)
!139 = distinct !DILexicalBlock(scope: !134, file: !17, line: 77, column: 17)
!140 = !DILocation(line: 77, column: 28, scope: !139)
!141 = !DILocation(line: 77, column: 17, scope: !134)
!142 = !DILocation(line: 77, column: 38, scope: !143)
!143 = distinct !DILexicalBlock(scope: !139, file: !17, line: 77, column: 37)
!144 = !DILocation(line: 78, column: 21, scope: !134)
!145 = !DILocation(line: 78, column: 13, scope: !134)
!146 = !DILocation(line: 79, column: 13, scope: !134)
!147 = !DILocation(line: 79, column: 31, scope: !134)
!148 = !DILocation(line: 81, column: 20, scope: !134)
!149 = !DILocation(line: 81, column: 18, scope: !134)
!150 = !DILocation(line: 83, column: 21, scope: !129)
!151 = !DILocation(line: 83, column: 10, scope: !129)
!152 = !DILocation(line: 83, column: 19, scope: !129)
!153 = !DILocalVariable(name: "data", scope: !154, file: !17, line: 86, type: !4)
!154 = distinct !DILexicalBlock(scope: !120, file: !17, line: 85, column: 5)
!155 = !DILocation(line: 86, column: 19, scope: !154)
!156 = !DILocation(line: 86, column: 27, scope: !154)
!157 = !DILocation(line: 86, column: 26, scope: !154)
!158 = !DILocalVariable(name: "i", scope: !159, file: !17, line: 88, type: !61)
!159 = distinct !DILexicalBlock(scope: !154, file: !17, line: 87, column: 9)
!160 = !DILocation(line: 88, column: 20, scope: !159)
!161 = !DILocalVariable(name: "dest", scope: !159, file: !17, line: 89, type: !65)
!162 = !DILocation(line: 89, column: 21, scope: !159)
!163 = !DILocation(line: 90, column: 21, scope: !159)
!164 = !DILocation(line: 90, column: 13, scope: !159)
!165 = !DILocation(line: 91, column: 13, scope: !159)
!166 = !DILocation(line: 91, column: 25, scope: !159)
!167 = !DILocation(line: 93, column: 20, scope: !168)
!168 = distinct !DILexicalBlock(scope: !159, file: !17, line: 93, column: 13)
!169 = !DILocation(line: 93, column: 18, scope: !168)
!170 = !DILocation(line: 93, column: 25, scope: !171)
!171 = distinct !DILexicalBlock(scope: !168, file: !17, line: 93, column: 13)
!172 = !DILocation(line: 93, column: 27, scope: !171)
!173 = !DILocation(line: 93, column: 13, scope: !168)
!174 = !DILocation(line: 95, column: 27, scope: !175)
!175 = distinct !DILexicalBlock(scope: !171, file: !17, line: 94, column: 13)
!176 = !DILocation(line: 95, column: 32, scope: !175)
!177 = !DILocation(line: 95, column: 22, scope: !175)
!178 = !DILocation(line: 95, column: 17, scope: !175)
!179 = !DILocation(line: 95, column: 25, scope: !175)
!180 = !DILocation(line: 96, column: 13, scope: !175)
!181 = !DILocation(line: 93, column: 35, scope: !171)
!182 = !DILocation(line: 93, column: 13, scope: !171)
!183 = distinct !{!183, !173, !184, !91}
!184 = !DILocation(line: 96, column: 13, scope: !168)
!185 = !DILocation(line: 98, column: 13, scope: !159)
!186 = !DILocation(line: 98, column: 25, scope: !159)
!187 = !DILocation(line: 99, column: 24, scope: !159)
!188 = !DILocation(line: 99, column: 13, scope: !159)
!189 = !DILocation(line: 104, column: 1, scope: !120)
