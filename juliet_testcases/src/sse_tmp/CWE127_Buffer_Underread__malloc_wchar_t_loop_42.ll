; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_loop_42.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_loop_42.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_wchar_t_loop_42_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  store i32* null, i32** %data, align 8, !dbg !22
  %0 = load i32*, i32** %data, align 8, !dbg !23
  %call = call i32* @badSource(i32* %0), !dbg !24
  store i32* %call, i32** %data, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata i64* %i, metadata !26, metadata !DIExpression()), !dbg !30
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !31, metadata !DIExpression()), !dbg !35
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !36
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !37
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !38
  store i32 0, i32* %arrayidx, align 4, !dbg !39
  store i64 0, i64* %i, align 8, !dbg !40
  br label %for.cond, !dbg !42

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !43
  %cmp = icmp ult i64 %1, 100, !dbg !45
  br i1 %cmp, label %for.body, label %for.end, !dbg !46

for.body:                                         ; preds = %for.cond
  %2 = load i32*, i32** %data, align 8, !dbg !47
  %3 = load i64, i64* %i, align 8, !dbg !49
  %arrayidx2 = getelementptr inbounds i32, i32* %2, i64 %3, !dbg !47
  %4 = load i32, i32* %arrayidx2, align 4, !dbg !47
  %5 = load i64, i64* %i, align 8, !dbg !50
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %5, !dbg !51
  store i32 %4, i32* %arrayidx3, align 4, !dbg !52
  br label %for.inc, !dbg !53

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !54
  %inc = add i64 %6, 1, !dbg !54
  store i64 %inc, i64* %i, align 8, !dbg !54
  br label %for.cond, !dbg !55, !llvm.loop !56

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !59
  store i32 0, i32* %arrayidx4, align 4, !dbg !60
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !61
  call void @printWLine(i32* %arraydecay5), !dbg !62
  ret void, !dbg !63
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal i32* @badSource(i32* %data) #0 !dbg !64 {
entry:
  %data.addr = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !67, metadata !DIExpression()), !dbg !68
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !69, metadata !DIExpression()), !dbg !71
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !72
  %0 = bitcast i8* %call to i32*, !dbg !73
  store i32* %0, i32** %dataBuffer, align 8, !dbg !71
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !74
  %cmp = icmp eq i32* %1, null, !dbg !76
  br i1 %cmp, label %if.then, label %if.end, !dbg !77

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !78
  unreachable, !dbg !78

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !80
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 99) #5, !dbg !81
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !82
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !82
  store i32 0, i32* %arrayidx, align 4, !dbg !83
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !84
  %add.ptr = getelementptr inbounds i32, i32* %4, i64 -8, !dbg !85
  store i32* %add.ptr, i32** %data.addr, align 8, !dbg !86
  %5 = load i32*, i32** %data.addr, align 8, !dbg !87
  ret i32* %5, !dbg !88
}

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_wchar_t_loop_42_good() #0 !dbg !89 {
entry:
  call void @goodG2B(), !dbg !90
  ret void, !dbg !91
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !92 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !98, metadata !DIExpression()), !dbg !99
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !100, metadata !DIExpression()), !dbg !101
  %call = call i64 @time(i64* null) #5, !dbg !102
  %conv = trunc i64 %call to i32, !dbg !103
  call void @srand(i32 %conv) #5, !dbg !104
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !105
  call void @CWE127_Buffer_Underread__malloc_wchar_t_loop_42_good(), !dbg !106
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !107
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !108
  call void @CWE127_Buffer_Underread__malloc_wchar_t_loop_42_bad(), !dbg !109
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !110
  ret i32 0, !dbg !111
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !112 {
entry:
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !113, metadata !DIExpression()), !dbg !114
  store i32* null, i32** %data, align 8, !dbg !115
  %0 = load i32*, i32** %data, align 8, !dbg !116
  %call = call i32* @goodG2BSource(i32* %0), !dbg !117
  store i32* %call, i32** %data, align 8, !dbg !118
  call void @llvm.dbg.declare(metadata i64* %i, metadata !119, metadata !DIExpression()), !dbg !121
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !122, metadata !DIExpression()), !dbg !123
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !124
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !125
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !126
  store i32 0, i32* %arrayidx, align 4, !dbg !127
  store i64 0, i64* %i, align 8, !dbg !128
  br label %for.cond, !dbg !130

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !131
  %cmp = icmp ult i64 %1, 100, !dbg !133
  br i1 %cmp, label %for.body, label %for.end, !dbg !134

for.body:                                         ; preds = %for.cond
  %2 = load i32*, i32** %data, align 8, !dbg !135
  %3 = load i64, i64* %i, align 8, !dbg !137
  %arrayidx2 = getelementptr inbounds i32, i32* %2, i64 %3, !dbg !135
  %4 = load i32, i32* %arrayidx2, align 4, !dbg !135
  %5 = load i64, i64* %i, align 8, !dbg !138
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %5, !dbg !139
  store i32 %4, i32* %arrayidx3, align 4, !dbg !140
  br label %for.inc, !dbg !141

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !142
  %inc = add i64 %6, 1, !dbg !142
  store i64 %inc, i64* %i, align 8, !dbg !142
  br label %for.cond, !dbg !143, !llvm.loop !144

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !146
  store i32 0, i32* %arrayidx4, align 4, !dbg !147
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !148
  call void @printWLine(i32* %arraydecay5), !dbg !149
  ret void, !dbg !150
}

; Function Attrs: noinline nounwind uwtable
define internal i32* @goodG2BSource(i32* %data) #0 !dbg !151 {
entry:
  %data.addr = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !152, metadata !DIExpression()), !dbg !153
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !154, metadata !DIExpression()), !dbg !156
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !157
  %0 = bitcast i8* %call to i32*, !dbg !158
  store i32* %0, i32** %dataBuffer, align 8, !dbg !156
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !159
  %cmp = icmp eq i32* %1, null, !dbg !161
  br i1 %cmp, label %if.then, label %if.end, !dbg !162

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !163
  unreachable, !dbg !163

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !165
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 99) #5, !dbg !166
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !167
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !167
  store i32 0, i32* %arrayidx, align 4, !dbg !168
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !169
  store i32* %4, i32** %data.addr, align 8, !dbg !170
  %5 = load i32*, i32** %data.addr, align 8, !dbg !171
  ret i32* %5, !dbg !172
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_loop_42.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !5, !9}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !7, line: 74, baseType: !8)
!7 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"clang version 13.0.0"}
!16 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_wchar_t_loop_42_bad", scope: !17, file: !17, line: 36, type: !18, scopeLine: 37, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_loop_42.c", directory: "/home/joelyang/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 38, type: !5)
!21 = !DILocation(line: 38, column: 15, scope: !16)
!22 = !DILocation(line: 39, column: 10, scope: !16)
!23 = !DILocation(line: 40, column: 22, scope: !16)
!24 = !DILocation(line: 40, column: 12, scope: !16)
!25 = !DILocation(line: 40, column: 10, scope: !16)
!26 = !DILocalVariable(name: "i", scope: !27, file: !17, line: 42, type: !28)
!27 = distinct !DILexicalBlock(scope: !16, file: !17, line: 41, column: 5)
!28 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !7, line: 46, baseType: !29)
!29 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!30 = !DILocation(line: 42, column: 16, scope: !27)
!31 = !DILocalVariable(name: "dest", scope: !27, file: !17, line: 43, type: !32)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 3200, elements: !33)
!33 = !{!34}
!34 = !DISubrange(count: 100)
!35 = !DILocation(line: 43, column: 17, scope: !27)
!36 = !DILocation(line: 44, column: 17, scope: !27)
!37 = !DILocation(line: 44, column: 9, scope: !27)
!38 = !DILocation(line: 45, column: 9, scope: !27)
!39 = !DILocation(line: 45, column: 21, scope: !27)
!40 = !DILocation(line: 47, column: 16, scope: !41)
!41 = distinct !DILexicalBlock(scope: !27, file: !17, line: 47, column: 9)
!42 = !DILocation(line: 47, column: 14, scope: !41)
!43 = !DILocation(line: 47, column: 21, scope: !44)
!44 = distinct !DILexicalBlock(scope: !41, file: !17, line: 47, column: 9)
!45 = !DILocation(line: 47, column: 23, scope: !44)
!46 = !DILocation(line: 47, column: 9, scope: !41)
!47 = !DILocation(line: 49, column: 23, scope: !48)
!48 = distinct !DILexicalBlock(scope: !44, file: !17, line: 48, column: 9)
!49 = !DILocation(line: 49, column: 28, scope: !48)
!50 = !DILocation(line: 49, column: 18, scope: !48)
!51 = !DILocation(line: 49, column: 13, scope: !48)
!52 = !DILocation(line: 49, column: 21, scope: !48)
!53 = !DILocation(line: 50, column: 9, scope: !48)
!54 = !DILocation(line: 47, column: 31, scope: !44)
!55 = !DILocation(line: 47, column: 9, scope: !44)
!56 = distinct !{!56, !46, !57, !58}
!57 = !DILocation(line: 50, column: 9, scope: !41)
!58 = !{!"llvm.loop.mustprogress"}
!59 = !DILocation(line: 52, column: 9, scope: !27)
!60 = !DILocation(line: 52, column: 21, scope: !27)
!61 = !DILocation(line: 53, column: 20, scope: !27)
!62 = !DILocation(line: 53, column: 9, scope: !27)
!63 = !DILocation(line: 57, column: 1, scope: !16)
!64 = distinct !DISubprogram(name: "badSource", scope: !17, file: !17, line: 23, type: !65, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!65 = !DISubroutineType(types: !66)
!66 = !{!5, !5}
!67 = !DILocalVariable(name: "data", arg: 1, scope: !64, file: !17, line: 23, type: !5)
!68 = !DILocation(line: 23, column: 38, scope: !64)
!69 = !DILocalVariable(name: "dataBuffer", scope: !70, file: !17, line: 26, type: !5)
!70 = distinct !DILexicalBlock(scope: !64, file: !17, line: 25, column: 5)
!71 = !DILocation(line: 26, column: 19, scope: !70)
!72 = !DILocation(line: 26, column: 43, scope: !70)
!73 = !DILocation(line: 26, column: 32, scope: !70)
!74 = !DILocation(line: 27, column: 13, scope: !75)
!75 = distinct !DILexicalBlock(scope: !70, file: !17, line: 27, column: 13)
!76 = !DILocation(line: 27, column: 24, scope: !75)
!77 = !DILocation(line: 27, column: 13, scope: !70)
!78 = !DILocation(line: 27, column: 34, scope: !79)
!79 = distinct !DILexicalBlock(scope: !75, file: !17, line: 27, column: 33)
!80 = !DILocation(line: 28, column: 17, scope: !70)
!81 = !DILocation(line: 28, column: 9, scope: !70)
!82 = !DILocation(line: 29, column: 9, scope: !70)
!83 = !DILocation(line: 29, column: 27, scope: !70)
!84 = !DILocation(line: 31, column: 16, scope: !70)
!85 = !DILocation(line: 31, column: 27, scope: !70)
!86 = !DILocation(line: 31, column: 14, scope: !70)
!87 = !DILocation(line: 33, column: 12, scope: !64)
!88 = !DILocation(line: 33, column: 5, scope: !64)
!89 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_wchar_t_loop_42_good", scope: !17, file: !17, line: 100, type: !18, scopeLine: 101, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!90 = !DILocation(line: 102, column: 5, scope: !89)
!91 = !DILocation(line: 103, column: 1, scope: !89)
!92 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 115, type: !93, scopeLine: 116, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!93 = !DISubroutineType(types: !94)
!94 = !{!8, !8, !95}
!95 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !96, size: 64)
!96 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !97, size: 64)
!97 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!98 = !DILocalVariable(name: "argc", arg: 1, scope: !92, file: !17, line: 115, type: !8)
!99 = !DILocation(line: 115, column: 14, scope: !92)
!100 = !DILocalVariable(name: "argv", arg: 2, scope: !92, file: !17, line: 115, type: !95)
!101 = !DILocation(line: 115, column: 27, scope: !92)
!102 = !DILocation(line: 118, column: 22, scope: !92)
!103 = !DILocation(line: 118, column: 12, scope: !92)
!104 = !DILocation(line: 118, column: 5, scope: !92)
!105 = !DILocation(line: 120, column: 5, scope: !92)
!106 = !DILocation(line: 121, column: 5, scope: !92)
!107 = !DILocation(line: 122, column: 5, scope: !92)
!108 = !DILocation(line: 125, column: 5, scope: !92)
!109 = !DILocation(line: 126, column: 5, scope: !92)
!110 = !DILocation(line: 127, column: 5, scope: !92)
!111 = !DILocation(line: 129, column: 5, scope: !92)
!112 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 77, type: !18, scopeLine: 78, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!113 = !DILocalVariable(name: "data", scope: !112, file: !17, line: 79, type: !5)
!114 = !DILocation(line: 79, column: 15, scope: !112)
!115 = !DILocation(line: 80, column: 10, scope: !112)
!116 = !DILocation(line: 81, column: 26, scope: !112)
!117 = !DILocation(line: 81, column: 12, scope: !112)
!118 = !DILocation(line: 81, column: 10, scope: !112)
!119 = !DILocalVariable(name: "i", scope: !120, file: !17, line: 83, type: !28)
!120 = distinct !DILexicalBlock(scope: !112, file: !17, line: 82, column: 5)
!121 = !DILocation(line: 83, column: 16, scope: !120)
!122 = !DILocalVariable(name: "dest", scope: !120, file: !17, line: 84, type: !32)
!123 = !DILocation(line: 84, column: 17, scope: !120)
!124 = !DILocation(line: 85, column: 17, scope: !120)
!125 = !DILocation(line: 85, column: 9, scope: !120)
!126 = !DILocation(line: 86, column: 9, scope: !120)
!127 = !DILocation(line: 86, column: 21, scope: !120)
!128 = !DILocation(line: 88, column: 16, scope: !129)
!129 = distinct !DILexicalBlock(scope: !120, file: !17, line: 88, column: 9)
!130 = !DILocation(line: 88, column: 14, scope: !129)
!131 = !DILocation(line: 88, column: 21, scope: !132)
!132 = distinct !DILexicalBlock(scope: !129, file: !17, line: 88, column: 9)
!133 = !DILocation(line: 88, column: 23, scope: !132)
!134 = !DILocation(line: 88, column: 9, scope: !129)
!135 = !DILocation(line: 90, column: 23, scope: !136)
!136 = distinct !DILexicalBlock(scope: !132, file: !17, line: 89, column: 9)
!137 = !DILocation(line: 90, column: 28, scope: !136)
!138 = !DILocation(line: 90, column: 18, scope: !136)
!139 = !DILocation(line: 90, column: 13, scope: !136)
!140 = !DILocation(line: 90, column: 21, scope: !136)
!141 = !DILocation(line: 91, column: 9, scope: !136)
!142 = !DILocation(line: 88, column: 31, scope: !132)
!143 = !DILocation(line: 88, column: 9, scope: !132)
!144 = distinct !{!144, !134, !145, !58}
!145 = !DILocation(line: 91, column: 9, scope: !129)
!146 = !DILocation(line: 93, column: 9, scope: !120)
!147 = !DILocation(line: 93, column: 21, scope: !120)
!148 = !DILocation(line: 94, column: 20, scope: !120)
!149 = !DILocation(line: 94, column: 9, scope: !120)
!150 = !DILocation(line: 98, column: 1, scope: !112)
!151 = distinct !DISubprogram(name: "goodG2BSource", scope: !17, file: !17, line: 63, type: !65, scopeLine: 64, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!152 = !DILocalVariable(name: "data", arg: 1, scope: !151, file: !17, line: 63, type: !5)
!153 = !DILocation(line: 63, column: 42, scope: !151)
!154 = !DILocalVariable(name: "dataBuffer", scope: !155, file: !17, line: 66, type: !5)
!155 = distinct !DILexicalBlock(scope: !151, file: !17, line: 65, column: 5)
!156 = !DILocation(line: 66, column: 19, scope: !155)
!157 = !DILocation(line: 66, column: 43, scope: !155)
!158 = !DILocation(line: 66, column: 32, scope: !155)
!159 = !DILocation(line: 67, column: 13, scope: !160)
!160 = distinct !DILexicalBlock(scope: !155, file: !17, line: 67, column: 13)
!161 = !DILocation(line: 67, column: 24, scope: !160)
!162 = !DILocation(line: 67, column: 13, scope: !155)
!163 = !DILocation(line: 67, column: 34, scope: !164)
!164 = distinct !DILexicalBlock(scope: !160, file: !17, line: 67, column: 33)
!165 = !DILocation(line: 68, column: 17, scope: !155)
!166 = !DILocation(line: 68, column: 9, scope: !155)
!167 = !DILocation(line: 69, column: 9, scope: !155)
!168 = !DILocation(line: 69, column: 27, scope: !155)
!169 = !DILocation(line: 71, column: 16, scope: !155)
!170 = !DILocation(line: 71, column: 14, scope: !155)
!171 = !DILocation(line: 73, column: 12, scope: !151)
!172 = !DILocation(line: 73, column: 5, scope: !151)
