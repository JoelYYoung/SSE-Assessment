; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_loop_17.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_loop_17.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_wchar_t_loop_17_bad() #0 !dbg !16 {
entry:
  %i = alloca i32, align 4
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %i3 = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %i, metadata !20, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata i32** %data, metadata !22, metadata !DIExpression()), !dbg !23
  store i32* null, i32** %data, align 8, !dbg !24
  store i32 0, i32* %i, align 4, !dbg !25
  br label %for.cond, !dbg !27

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !28
  %cmp = icmp slt i32 %0, 1, !dbg !30
  br i1 %cmp, label %for.body, label %for.end, !dbg !31

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !32, metadata !DIExpression()), !dbg !35
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !36
  %1 = bitcast i8* %call to i32*, !dbg !37
  store i32* %1, i32** %dataBuffer, align 8, !dbg !35
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !38
  %cmp1 = icmp eq i32* %2, null, !dbg !40
  br i1 %cmp1, label %if.then, label %if.end, !dbg !41

if.then:                                          ; preds = %for.body
  call void @exit(i32 -1) #6, !dbg !42
  unreachable, !dbg !42

if.end:                                           ; preds = %for.body
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !44
  %call2 = call i32* @wmemset(i32* %3, i32 65, i64 99) #5, !dbg !45
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !46
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !46
  store i32 0, i32* %arrayidx, align 4, !dbg !47
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !48
  %add.ptr = getelementptr inbounds i32, i32* %5, i64 -8, !dbg !49
  store i32* %add.ptr, i32** %data, align 8, !dbg !50
  br label %for.inc, !dbg !51

for.inc:                                          ; preds = %if.end
  %6 = load i32, i32* %i, align 4, !dbg !52
  %inc = add nsw i32 %6, 1, !dbg !52
  store i32 %inc, i32* %i, align 4, !dbg !52
  br label %for.cond, !dbg !53, !llvm.loop !54

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i3, metadata !57, metadata !DIExpression()), !dbg !61
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !62, metadata !DIExpression()), !dbg !66
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !67
  %call4 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !68
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !69
  store i32 0, i32* %arrayidx5, align 4, !dbg !70
  store i64 0, i64* %i3, align 8, !dbg !71
  br label %for.cond6, !dbg !73

for.cond6:                                        ; preds = %for.inc11, %for.end
  %7 = load i64, i64* %i3, align 8, !dbg !74
  %cmp7 = icmp ult i64 %7, 100, !dbg !76
  br i1 %cmp7, label %for.body8, label %for.end13, !dbg !77

for.body8:                                        ; preds = %for.cond6
  %8 = load i32*, i32** %data, align 8, !dbg !78
  %9 = load i64, i64* %i3, align 8, !dbg !80
  %arrayidx9 = getelementptr inbounds i32, i32* %8, i64 %9, !dbg !78
  %10 = load i32, i32* %arrayidx9, align 4, !dbg !78
  %11 = load i64, i64* %i3, align 8, !dbg !81
  %arrayidx10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %11, !dbg !82
  store i32 %10, i32* %arrayidx10, align 4, !dbg !83
  br label %for.inc11, !dbg !84

for.inc11:                                        ; preds = %for.body8
  %12 = load i64, i64* %i3, align 8, !dbg !85
  %inc12 = add i64 %12, 1, !dbg !85
  store i64 %inc12, i64* %i3, align 8, !dbg !85
  br label %for.cond6, !dbg !86, !llvm.loop !87

for.end13:                                        ; preds = %for.cond6
  %arrayidx14 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !89
  store i32 0, i32* %arrayidx14, align 4, !dbg !90
  %arraydecay15 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !91
  call void @printWLine(i32* %arraydecay15), !dbg !92
  ret void, !dbg !93
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
define dso_local void @CWE127_Buffer_Underread__malloc_wchar_t_loop_17_good() #0 !dbg !94 {
entry:
  call void @goodG2B(), !dbg !95
  ret void, !dbg !96
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !97 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !103, metadata !DIExpression()), !dbg !104
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !105, metadata !DIExpression()), !dbg !106
  %call = call i64 @time(i64* null) #5, !dbg !107
  %conv = trunc i64 %call to i32, !dbg !108
  call void @srand(i32 %conv) #5, !dbg !109
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !110
  call void @CWE127_Buffer_Underread__malloc_wchar_t_loop_17_good(), !dbg !111
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !112
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !113
  call void @CWE127_Buffer_Underread__malloc_wchar_t_loop_17_bad(), !dbg !114
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !115
  ret i32 0, !dbg !116
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !117 {
entry:
  %h = alloca i32, align 4
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %h, metadata !118, metadata !DIExpression()), !dbg !119
  call void @llvm.dbg.declare(metadata i32** %data, metadata !120, metadata !DIExpression()), !dbg !121
  store i32* null, i32** %data, align 8, !dbg !122
  store i32 0, i32* %h, align 4, !dbg !123
  br label %for.cond, !dbg !125

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %h, align 4, !dbg !126
  %cmp = icmp slt i32 %0, 1, !dbg !128
  br i1 %cmp, label %for.body, label %for.end, !dbg !129

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !130, metadata !DIExpression()), !dbg !133
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !134
  %1 = bitcast i8* %call to i32*, !dbg !135
  store i32* %1, i32** %dataBuffer, align 8, !dbg !133
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !136
  %cmp1 = icmp eq i32* %2, null, !dbg !138
  br i1 %cmp1, label %if.then, label %if.end, !dbg !139

if.then:                                          ; preds = %for.body
  call void @exit(i32 -1) #6, !dbg !140
  unreachable, !dbg !140

if.end:                                           ; preds = %for.body
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !142
  %call2 = call i32* @wmemset(i32* %3, i32 65, i64 99) #5, !dbg !143
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !144
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !144
  store i32 0, i32* %arrayidx, align 4, !dbg !145
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !146
  store i32* %5, i32** %data, align 8, !dbg !147
  br label %for.inc, !dbg !148

for.inc:                                          ; preds = %if.end
  %6 = load i32, i32* %h, align 4, !dbg !149
  %inc = add nsw i32 %6, 1, !dbg !149
  store i32 %inc, i32* %h, align 4, !dbg !149
  br label %for.cond, !dbg !150, !llvm.loop !151

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i, metadata !153, metadata !DIExpression()), !dbg !155
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !156, metadata !DIExpression()), !dbg !157
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !158
  %call3 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !159
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !160
  store i32 0, i32* %arrayidx4, align 4, !dbg !161
  store i64 0, i64* %i, align 8, !dbg !162
  br label %for.cond5, !dbg !164

for.cond5:                                        ; preds = %for.inc10, %for.end
  %7 = load i64, i64* %i, align 8, !dbg !165
  %cmp6 = icmp ult i64 %7, 100, !dbg !167
  br i1 %cmp6, label %for.body7, label %for.end12, !dbg !168

for.body7:                                        ; preds = %for.cond5
  %8 = load i32*, i32** %data, align 8, !dbg !169
  %9 = load i64, i64* %i, align 8, !dbg !171
  %arrayidx8 = getelementptr inbounds i32, i32* %8, i64 %9, !dbg !169
  %10 = load i32, i32* %arrayidx8, align 4, !dbg !169
  %11 = load i64, i64* %i, align 8, !dbg !172
  %arrayidx9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %11, !dbg !173
  store i32 %10, i32* %arrayidx9, align 4, !dbg !174
  br label %for.inc10, !dbg !175

for.inc10:                                        ; preds = %for.body7
  %12 = load i64, i64* %i, align 8, !dbg !176
  %inc11 = add i64 %12, 1, !dbg !176
  store i64 %inc11, i64* %i, align 8, !dbg !176
  br label %for.cond5, !dbg !177, !llvm.loop !178

for.end12:                                        ; preds = %for.cond5
  %arrayidx13 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !180
  store i32 0, i32* %arrayidx13, align 4, !dbg !181
  %arraydecay14 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !182
  call void @printWLine(i32* %arraydecay14), !dbg !183
  ret void, !dbg !184
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_loop_17.c", directory: "/home/joelyang/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_wchar_t_loop_17_bad", scope: !17, file: !17, line: 23, type: !18, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_loop_17.c", directory: "/home/joelyang/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "i", scope: !16, file: !17, line: 25, type: !7)
!21 = !DILocation(line: 25, column: 9, scope: !16)
!22 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 26, type: !4)
!23 = !DILocation(line: 26, column: 15, scope: !16)
!24 = !DILocation(line: 27, column: 10, scope: !16)
!25 = !DILocation(line: 28, column: 11, scope: !26)
!26 = distinct !DILexicalBlock(scope: !16, file: !17, line: 28, column: 5)
!27 = !DILocation(line: 28, column: 9, scope: !26)
!28 = !DILocation(line: 28, column: 16, scope: !29)
!29 = distinct !DILexicalBlock(scope: !26, file: !17, line: 28, column: 5)
!30 = !DILocation(line: 28, column: 18, scope: !29)
!31 = !DILocation(line: 28, column: 5, scope: !26)
!32 = !DILocalVariable(name: "dataBuffer", scope: !33, file: !17, line: 31, type: !4)
!33 = distinct !DILexicalBlock(scope: !34, file: !17, line: 30, column: 9)
!34 = distinct !DILexicalBlock(scope: !29, file: !17, line: 29, column: 5)
!35 = !DILocation(line: 31, column: 23, scope: !33)
!36 = !DILocation(line: 31, column: 47, scope: !33)
!37 = !DILocation(line: 31, column: 36, scope: !33)
!38 = !DILocation(line: 32, column: 17, scope: !39)
!39 = distinct !DILexicalBlock(scope: !33, file: !17, line: 32, column: 17)
!40 = !DILocation(line: 32, column: 28, scope: !39)
!41 = !DILocation(line: 32, column: 17, scope: !33)
!42 = !DILocation(line: 32, column: 38, scope: !43)
!43 = distinct !DILexicalBlock(scope: !39, file: !17, line: 32, column: 37)
!44 = !DILocation(line: 33, column: 21, scope: !33)
!45 = !DILocation(line: 33, column: 13, scope: !33)
!46 = !DILocation(line: 34, column: 13, scope: !33)
!47 = !DILocation(line: 34, column: 31, scope: !33)
!48 = !DILocation(line: 36, column: 20, scope: !33)
!49 = !DILocation(line: 36, column: 31, scope: !33)
!50 = !DILocation(line: 36, column: 18, scope: !33)
!51 = !DILocation(line: 38, column: 5, scope: !34)
!52 = !DILocation(line: 28, column: 24, scope: !29)
!53 = !DILocation(line: 28, column: 5, scope: !29)
!54 = distinct !{!54, !31, !55, !56}
!55 = !DILocation(line: 38, column: 5, scope: !26)
!56 = !{!"llvm.loop.mustprogress"}
!57 = !DILocalVariable(name: "i", scope: !58, file: !17, line: 40, type: !59)
!58 = distinct !DILexicalBlock(scope: !16, file: !17, line: 39, column: 5)
!59 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !6, line: 46, baseType: !60)
!60 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!61 = !DILocation(line: 40, column: 16, scope: !58)
!62 = !DILocalVariable(name: "dest", scope: !58, file: !17, line: 41, type: !63)
!63 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !64)
!64 = !{!65}
!65 = !DISubrange(count: 100)
!66 = !DILocation(line: 41, column: 17, scope: !58)
!67 = !DILocation(line: 42, column: 17, scope: !58)
!68 = !DILocation(line: 42, column: 9, scope: !58)
!69 = !DILocation(line: 43, column: 9, scope: !58)
!70 = !DILocation(line: 43, column: 21, scope: !58)
!71 = !DILocation(line: 45, column: 16, scope: !72)
!72 = distinct !DILexicalBlock(scope: !58, file: !17, line: 45, column: 9)
!73 = !DILocation(line: 45, column: 14, scope: !72)
!74 = !DILocation(line: 45, column: 21, scope: !75)
!75 = distinct !DILexicalBlock(scope: !72, file: !17, line: 45, column: 9)
!76 = !DILocation(line: 45, column: 23, scope: !75)
!77 = !DILocation(line: 45, column: 9, scope: !72)
!78 = !DILocation(line: 47, column: 23, scope: !79)
!79 = distinct !DILexicalBlock(scope: !75, file: !17, line: 46, column: 9)
!80 = !DILocation(line: 47, column: 28, scope: !79)
!81 = !DILocation(line: 47, column: 18, scope: !79)
!82 = !DILocation(line: 47, column: 13, scope: !79)
!83 = !DILocation(line: 47, column: 21, scope: !79)
!84 = !DILocation(line: 48, column: 9, scope: !79)
!85 = !DILocation(line: 45, column: 31, scope: !75)
!86 = !DILocation(line: 45, column: 9, scope: !75)
!87 = distinct !{!87, !77, !88, !56}
!88 = !DILocation(line: 48, column: 9, scope: !72)
!89 = !DILocation(line: 50, column: 9, scope: !58)
!90 = !DILocation(line: 50, column: 21, scope: !58)
!91 = !DILocation(line: 51, column: 20, scope: !58)
!92 = !DILocation(line: 51, column: 9, scope: !58)
!93 = !DILocation(line: 55, column: 1, scope: !16)
!94 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_wchar_t_loop_17_good", scope: !17, file: !17, line: 96, type: !18, scopeLine: 97, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!95 = !DILocation(line: 98, column: 5, scope: !94)
!96 = !DILocation(line: 99, column: 1, scope: !94)
!97 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 111, type: !98, scopeLine: 112, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!98 = !DISubroutineType(types: !99)
!99 = !{!7, !7, !100}
!100 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !101, size: 64)
!101 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !102, size: 64)
!102 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!103 = !DILocalVariable(name: "argc", arg: 1, scope: !97, file: !17, line: 111, type: !7)
!104 = !DILocation(line: 111, column: 14, scope: !97)
!105 = !DILocalVariable(name: "argv", arg: 2, scope: !97, file: !17, line: 111, type: !100)
!106 = !DILocation(line: 111, column: 27, scope: !97)
!107 = !DILocation(line: 114, column: 22, scope: !97)
!108 = !DILocation(line: 114, column: 12, scope: !97)
!109 = !DILocation(line: 114, column: 5, scope: !97)
!110 = !DILocation(line: 116, column: 5, scope: !97)
!111 = !DILocation(line: 117, column: 5, scope: !97)
!112 = !DILocation(line: 118, column: 5, scope: !97)
!113 = !DILocation(line: 121, column: 5, scope: !97)
!114 = !DILocation(line: 122, column: 5, scope: !97)
!115 = !DILocation(line: 123, column: 5, scope: !97)
!116 = !DILocation(line: 125, column: 5, scope: !97)
!117 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 62, type: !18, scopeLine: 63, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!118 = !DILocalVariable(name: "h", scope: !117, file: !17, line: 64, type: !7)
!119 = !DILocation(line: 64, column: 9, scope: !117)
!120 = !DILocalVariable(name: "data", scope: !117, file: !17, line: 65, type: !4)
!121 = !DILocation(line: 65, column: 15, scope: !117)
!122 = !DILocation(line: 66, column: 10, scope: !117)
!123 = !DILocation(line: 67, column: 11, scope: !124)
!124 = distinct !DILexicalBlock(scope: !117, file: !17, line: 67, column: 5)
!125 = !DILocation(line: 67, column: 9, scope: !124)
!126 = !DILocation(line: 67, column: 16, scope: !127)
!127 = distinct !DILexicalBlock(scope: !124, file: !17, line: 67, column: 5)
!128 = !DILocation(line: 67, column: 18, scope: !127)
!129 = !DILocation(line: 67, column: 5, scope: !124)
!130 = !DILocalVariable(name: "dataBuffer", scope: !131, file: !17, line: 70, type: !4)
!131 = distinct !DILexicalBlock(scope: !132, file: !17, line: 69, column: 9)
!132 = distinct !DILexicalBlock(scope: !127, file: !17, line: 68, column: 5)
!133 = !DILocation(line: 70, column: 23, scope: !131)
!134 = !DILocation(line: 70, column: 47, scope: !131)
!135 = !DILocation(line: 70, column: 36, scope: !131)
!136 = !DILocation(line: 71, column: 17, scope: !137)
!137 = distinct !DILexicalBlock(scope: !131, file: !17, line: 71, column: 17)
!138 = !DILocation(line: 71, column: 28, scope: !137)
!139 = !DILocation(line: 71, column: 17, scope: !131)
!140 = !DILocation(line: 71, column: 38, scope: !141)
!141 = distinct !DILexicalBlock(scope: !137, file: !17, line: 71, column: 37)
!142 = !DILocation(line: 72, column: 21, scope: !131)
!143 = !DILocation(line: 72, column: 13, scope: !131)
!144 = !DILocation(line: 73, column: 13, scope: !131)
!145 = !DILocation(line: 73, column: 31, scope: !131)
!146 = !DILocation(line: 75, column: 20, scope: !131)
!147 = !DILocation(line: 75, column: 18, scope: !131)
!148 = !DILocation(line: 77, column: 5, scope: !132)
!149 = !DILocation(line: 67, column: 24, scope: !127)
!150 = !DILocation(line: 67, column: 5, scope: !127)
!151 = distinct !{!151, !129, !152, !56}
!152 = !DILocation(line: 77, column: 5, scope: !124)
!153 = !DILocalVariable(name: "i", scope: !154, file: !17, line: 79, type: !59)
!154 = distinct !DILexicalBlock(scope: !117, file: !17, line: 78, column: 5)
!155 = !DILocation(line: 79, column: 16, scope: !154)
!156 = !DILocalVariable(name: "dest", scope: !154, file: !17, line: 80, type: !63)
!157 = !DILocation(line: 80, column: 17, scope: !154)
!158 = !DILocation(line: 81, column: 17, scope: !154)
!159 = !DILocation(line: 81, column: 9, scope: !154)
!160 = !DILocation(line: 82, column: 9, scope: !154)
!161 = !DILocation(line: 82, column: 21, scope: !154)
!162 = !DILocation(line: 84, column: 16, scope: !163)
!163 = distinct !DILexicalBlock(scope: !154, file: !17, line: 84, column: 9)
!164 = !DILocation(line: 84, column: 14, scope: !163)
!165 = !DILocation(line: 84, column: 21, scope: !166)
!166 = distinct !DILexicalBlock(scope: !163, file: !17, line: 84, column: 9)
!167 = !DILocation(line: 84, column: 23, scope: !166)
!168 = !DILocation(line: 84, column: 9, scope: !163)
!169 = !DILocation(line: 86, column: 23, scope: !170)
!170 = distinct !DILexicalBlock(scope: !166, file: !17, line: 85, column: 9)
!171 = !DILocation(line: 86, column: 28, scope: !170)
!172 = !DILocation(line: 86, column: 18, scope: !170)
!173 = !DILocation(line: 86, column: 13, scope: !170)
!174 = !DILocation(line: 86, column: 21, scope: !170)
!175 = !DILocation(line: 87, column: 9, scope: !170)
!176 = !DILocation(line: 84, column: 31, scope: !166)
!177 = !DILocation(line: 84, column: 9, scope: !166)
!178 = distinct !{!178, !168, !179, !56}
!179 = !DILocation(line: 87, column: 9, scope: !163)
!180 = !DILocation(line: 89, column: 9, scope: !154)
!181 = !DILocation(line: 89, column: 21, scope: !154)
!182 = !DILocation(line: 90, column: 20, scope: !154)
!183 = !DILocation(line: 90, column: 9, scope: !154)
!184 = !DILocation(line: 94, column: 1, scope: !117)
