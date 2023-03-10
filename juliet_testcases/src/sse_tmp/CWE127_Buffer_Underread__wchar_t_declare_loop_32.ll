; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_declare_loop_32.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_declare_loop_32.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__wchar_t_declare_loop_32_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataPtr1 = alloca i32**, align 8
  %dataPtr2 = alloca i32**, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %data1 = alloca i32*, align 8
  %data3 = alloca i32*, align 8
  %i = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32*** %dataPtr1, metadata !21, metadata !DIExpression()), !dbg !23
  store i32** %data, i32*** %dataPtr1, align 8, !dbg !23
  call void @llvm.dbg.declare(metadata i32*** %dataPtr2, metadata !24, metadata !DIExpression()), !dbg !25
  store i32** %data, i32*** %dataPtr2, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !26, metadata !DIExpression()), !dbg !30
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !31
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 99) #4, !dbg !32
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 99, !dbg !33
  store i32 0, i32* %arrayidx, align 4, !dbg !34
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !35, metadata !DIExpression()), !dbg !37
  %0 = load i32**, i32*** %dataPtr1, align 8, !dbg !38
  %1 = load i32*, i32** %0, align 8, !dbg !39
  store i32* %1, i32** %data1, align 8, !dbg !37
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !40
  %add.ptr = getelementptr inbounds i32, i32* %arraydecay2, i64 -8, !dbg !41
  store i32* %add.ptr, i32** %data1, align 8, !dbg !42
  %2 = load i32*, i32** %data1, align 8, !dbg !43
  %3 = load i32**, i32*** %dataPtr1, align 8, !dbg !44
  store i32* %2, i32** %3, align 8, !dbg !45
  call void @llvm.dbg.declare(metadata i32** %data3, metadata !46, metadata !DIExpression()), !dbg !48
  %4 = load i32**, i32*** %dataPtr2, align 8, !dbg !49
  %5 = load i32*, i32** %4, align 8, !dbg !50
  store i32* %5, i32** %data3, align 8, !dbg !48
  call void @llvm.dbg.declare(metadata i64* %i, metadata !51, metadata !DIExpression()), !dbg !55
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !56, metadata !DIExpression()), !dbg !57
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !58
  %call5 = call i32* @wmemset(i32* %arraydecay4, i32 67, i64 99) #4, !dbg !59
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !60
  store i32 0, i32* %arrayidx6, align 4, !dbg !61
  store i64 0, i64* %i, align 8, !dbg !62
  br label %for.cond, !dbg !64

for.cond:                                         ; preds = %for.inc, %entry
  %6 = load i64, i64* %i, align 8, !dbg !65
  %cmp = icmp ult i64 %6, 100, !dbg !67
  br i1 %cmp, label %for.body, label %for.end, !dbg !68

for.body:                                         ; preds = %for.cond
  %7 = load i32*, i32** %data3, align 8, !dbg !69
  %8 = load i64, i64* %i, align 8, !dbg !71
  %arrayidx7 = getelementptr inbounds i32, i32* %7, i64 %8, !dbg !69
  %9 = load i32, i32* %arrayidx7, align 4, !dbg !69
  %10 = load i64, i64* %i, align 8, !dbg !72
  %arrayidx8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %10, !dbg !73
  store i32 %9, i32* %arrayidx8, align 4, !dbg !74
  br label %for.inc, !dbg !75

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !76
  %inc = add i64 %11, 1, !dbg !76
  store i64 %inc, i64* %i, align 8, !dbg !76
  br label %for.cond, !dbg !77, !llvm.loop !78

for.end:                                          ; preds = %for.cond
  %arrayidx9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !81
  store i32 0, i32* %arrayidx9, align 4, !dbg !82
  %arraydecay10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !83
  call void @printWLine(i32* %arraydecay10), !dbg !84
  ret void, !dbg !85
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__wchar_t_declare_loop_32_good() #0 !dbg !86 {
entry:
  call void @goodG2B(), !dbg !87
  ret void, !dbg !88
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !89 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !95, metadata !DIExpression()), !dbg !96
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !97, metadata !DIExpression()), !dbg !98
  %call = call i64 @time(i64* null) #4, !dbg !99
  %conv = trunc i64 %call to i32, !dbg !100
  call void @srand(i32 %conv) #4, !dbg !101
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !102
  call void @CWE127_Buffer_Underread__wchar_t_declare_loop_32_good(), !dbg !103
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !104
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !105
  call void @CWE127_Buffer_Underread__wchar_t_declare_loop_32_bad(), !dbg !106
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !107
  ret i32 0, !dbg !108
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !109 {
entry:
  %data = alloca i32*, align 8
  %dataPtr1 = alloca i32**, align 8
  %dataPtr2 = alloca i32**, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %data1 = alloca i32*, align 8
  %data3 = alloca i32*, align 8
  %i = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !110, metadata !DIExpression()), !dbg !111
  call void @llvm.dbg.declare(metadata i32*** %dataPtr1, metadata !112, metadata !DIExpression()), !dbg !113
  store i32** %data, i32*** %dataPtr1, align 8, !dbg !113
  call void @llvm.dbg.declare(metadata i32*** %dataPtr2, metadata !114, metadata !DIExpression()), !dbg !115
  store i32** %data, i32*** %dataPtr2, align 8, !dbg !115
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !116, metadata !DIExpression()), !dbg !117
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !118
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 99) #4, !dbg !119
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 99, !dbg !120
  store i32 0, i32* %arrayidx, align 4, !dbg !121
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !122, metadata !DIExpression()), !dbg !124
  %0 = load i32**, i32*** %dataPtr1, align 8, !dbg !125
  %1 = load i32*, i32** %0, align 8, !dbg !126
  store i32* %1, i32** %data1, align 8, !dbg !124
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !127
  store i32* %arraydecay2, i32** %data1, align 8, !dbg !128
  %2 = load i32*, i32** %data1, align 8, !dbg !129
  %3 = load i32**, i32*** %dataPtr1, align 8, !dbg !130
  store i32* %2, i32** %3, align 8, !dbg !131
  call void @llvm.dbg.declare(metadata i32** %data3, metadata !132, metadata !DIExpression()), !dbg !134
  %4 = load i32**, i32*** %dataPtr2, align 8, !dbg !135
  %5 = load i32*, i32** %4, align 8, !dbg !136
  store i32* %5, i32** %data3, align 8, !dbg !134
  call void @llvm.dbg.declare(metadata i64* %i, metadata !137, metadata !DIExpression()), !dbg !139
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !140, metadata !DIExpression()), !dbg !141
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !142
  %call5 = call i32* @wmemset(i32* %arraydecay4, i32 67, i64 99) #4, !dbg !143
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !144
  store i32 0, i32* %arrayidx6, align 4, !dbg !145
  store i64 0, i64* %i, align 8, !dbg !146
  br label %for.cond, !dbg !148

for.cond:                                         ; preds = %for.inc, %entry
  %6 = load i64, i64* %i, align 8, !dbg !149
  %cmp = icmp ult i64 %6, 100, !dbg !151
  br i1 %cmp, label %for.body, label %for.end, !dbg !152

for.body:                                         ; preds = %for.cond
  %7 = load i32*, i32** %data3, align 8, !dbg !153
  %8 = load i64, i64* %i, align 8, !dbg !155
  %arrayidx7 = getelementptr inbounds i32, i32* %7, i64 %8, !dbg !153
  %9 = load i32, i32* %arrayidx7, align 4, !dbg !153
  %10 = load i64, i64* %i, align 8, !dbg !156
  %arrayidx8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %10, !dbg !157
  store i32 %9, i32* %arrayidx8, align 4, !dbg !158
  br label %for.inc, !dbg !159

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !160
  %inc = add i64 %11, 1, !dbg !160
  store i64 %inc, i64* %i, align 8, !dbg !160
  br label %for.cond, !dbg !161, !llvm.loop !162

for.end:                                          ; preds = %for.cond
  %arrayidx9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !164
  store i32 0, i32* %arrayidx9, align 4, !dbg !165
  %arraydecay10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !166
  call void @printWLine(i32* %arraydecay10), !dbg !167
  ret void, !dbg !168
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_declare_loop_32.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__wchar_t_declare_loop_32_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_declare_loop_32.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 25, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !18, line: 74, baseType: !19)
!18 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 25, column: 15, scope: !11)
!21 = !DILocalVariable(name: "dataPtr1", scope: !11, file: !12, line: 26, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!23 = !DILocation(line: 26, column: 16, scope: !11)
!24 = !DILocalVariable(name: "dataPtr2", scope: !11, file: !12, line: 27, type: !22)
!25 = !DILocation(line: 27, column: 16, scope: !11)
!26 = !DILocalVariable(name: "dataBuffer", scope: !11, file: !12, line: 28, type: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 100)
!30 = !DILocation(line: 28, column: 13, scope: !11)
!31 = !DILocation(line: 29, column: 13, scope: !11)
!32 = !DILocation(line: 29, column: 5, scope: !11)
!33 = !DILocation(line: 30, column: 5, scope: !11)
!34 = !DILocation(line: 30, column: 23, scope: !11)
!35 = !DILocalVariable(name: "data", scope: !36, file: !12, line: 32, type: !16)
!36 = distinct !DILexicalBlock(scope: !11, file: !12, line: 31, column: 5)
!37 = !DILocation(line: 32, column: 19, scope: !36)
!38 = !DILocation(line: 32, column: 27, scope: !36)
!39 = !DILocation(line: 32, column: 26, scope: !36)
!40 = !DILocation(line: 34, column: 16, scope: !36)
!41 = !DILocation(line: 34, column: 27, scope: !36)
!42 = !DILocation(line: 34, column: 14, scope: !36)
!43 = !DILocation(line: 35, column: 21, scope: !36)
!44 = !DILocation(line: 35, column: 10, scope: !36)
!45 = !DILocation(line: 35, column: 19, scope: !36)
!46 = !DILocalVariable(name: "data", scope: !47, file: !12, line: 38, type: !16)
!47 = distinct !DILexicalBlock(scope: !11, file: !12, line: 37, column: 5)
!48 = !DILocation(line: 38, column: 19, scope: !47)
!49 = !DILocation(line: 38, column: 27, scope: !47)
!50 = !DILocation(line: 38, column: 26, scope: !47)
!51 = !DILocalVariable(name: "i", scope: !52, file: !12, line: 40, type: !53)
!52 = distinct !DILexicalBlock(scope: !47, file: !12, line: 39, column: 9)
!53 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !18, line: 46, baseType: !54)
!54 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!55 = !DILocation(line: 40, column: 20, scope: !52)
!56 = !DILocalVariable(name: "dest", scope: !52, file: !12, line: 41, type: !27)
!57 = !DILocation(line: 41, column: 21, scope: !52)
!58 = !DILocation(line: 42, column: 21, scope: !52)
!59 = !DILocation(line: 42, column: 13, scope: !52)
!60 = !DILocation(line: 43, column: 13, scope: !52)
!61 = !DILocation(line: 43, column: 25, scope: !52)
!62 = !DILocation(line: 45, column: 20, scope: !63)
!63 = distinct !DILexicalBlock(scope: !52, file: !12, line: 45, column: 13)
!64 = !DILocation(line: 45, column: 18, scope: !63)
!65 = !DILocation(line: 45, column: 25, scope: !66)
!66 = distinct !DILexicalBlock(scope: !63, file: !12, line: 45, column: 13)
!67 = !DILocation(line: 45, column: 27, scope: !66)
!68 = !DILocation(line: 45, column: 13, scope: !63)
!69 = !DILocation(line: 47, column: 27, scope: !70)
!70 = distinct !DILexicalBlock(scope: !66, file: !12, line: 46, column: 13)
!71 = !DILocation(line: 47, column: 32, scope: !70)
!72 = !DILocation(line: 47, column: 22, scope: !70)
!73 = !DILocation(line: 47, column: 17, scope: !70)
!74 = !DILocation(line: 47, column: 25, scope: !70)
!75 = !DILocation(line: 48, column: 13, scope: !70)
!76 = !DILocation(line: 45, column: 35, scope: !66)
!77 = !DILocation(line: 45, column: 13, scope: !66)
!78 = distinct !{!78, !68, !79, !80}
!79 = !DILocation(line: 48, column: 13, scope: !63)
!80 = !{!"llvm.loop.mustprogress"}
!81 = !DILocation(line: 50, column: 13, scope: !52)
!82 = !DILocation(line: 50, column: 25, scope: !52)
!83 = !DILocation(line: 51, column: 24, scope: !52)
!84 = !DILocation(line: 51, column: 13, scope: !52)
!85 = !DILocation(line: 54, column: 1, scope: !11)
!86 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__wchar_t_declare_loop_32_good", scope: !12, file: !12, line: 94, type: !13, scopeLine: 95, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!87 = !DILocation(line: 96, column: 5, scope: !86)
!88 = !DILocation(line: 97, column: 1, scope: !86)
!89 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 108, type: !90, scopeLine: 109, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!90 = !DISubroutineType(types: !91)
!91 = !{!19, !19, !92}
!92 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !93, size: 64)
!93 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !94, size: 64)
!94 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!95 = !DILocalVariable(name: "argc", arg: 1, scope: !89, file: !12, line: 108, type: !19)
!96 = !DILocation(line: 108, column: 14, scope: !89)
!97 = !DILocalVariable(name: "argv", arg: 2, scope: !89, file: !12, line: 108, type: !92)
!98 = !DILocation(line: 108, column: 27, scope: !89)
!99 = !DILocation(line: 111, column: 22, scope: !89)
!100 = !DILocation(line: 111, column: 12, scope: !89)
!101 = !DILocation(line: 111, column: 5, scope: !89)
!102 = !DILocation(line: 113, column: 5, scope: !89)
!103 = !DILocation(line: 114, column: 5, scope: !89)
!104 = !DILocation(line: 115, column: 5, scope: !89)
!105 = !DILocation(line: 118, column: 5, scope: !89)
!106 = !DILocation(line: 119, column: 5, scope: !89)
!107 = !DILocation(line: 120, column: 5, scope: !89)
!108 = !DILocation(line: 122, column: 5, scope: !89)
!109 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 61, type: !13, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!110 = !DILocalVariable(name: "data", scope: !109, file: !12, line: 63, type: !16)
!111 = !DILocation(line: 63, column: 15, scope: !109)
!112 = !DILocalVariable(name: "dataPtr1", scope: !109, file: !12, line: 64, type: !22)
!113 = !DILocation(line: 64, column: 16, scope: !109)
!114 = !DILocalVariable(name: "dataPtr2", scope: !109, file: !12, line: 65, type: !22)
!115 = !DILocation(line: 65, column: 16, scope: !109)
!116 = !DILocalVariable(name: "dataBuffer", scope: !109, file: !12, line: 66, type: !27)
!117 = !DILocation(line: 66, column: 13, scope: !109)
!118 = !DILocation(line: 67, column: 13, scope: !109)
!119 = !DILocation(line: 67, column: 5, scope: !109)
!120 = !DILocation(line: 68, column: 5, scope: !109)
!121 = !DILocation(line: 68, column: 23, scope: !109)
!122 = !DILocalVariable(name: "data", scope: !123, file: !12, line: 70, type: !16)
!123 = distinct !DILexicalBlock(scope: !109, file: !12, line: 69, column: 5)
!124 = !DILocation(line: 70, column: 19, scope: !123)
!125 = !DILocation(line: 70, column: 27, scope: !123)
!126 = !DILocation(line: 70, column: 26, scope: !123)
!127 = !DILocation(line: 72, column: 16, scope: !123)
!128 = !DILocation(line: 72, column: 14, scope: !123)
!129 = !DILocation(line: 73, column: 21, scope: !123)
!130 = !DILocation(line: 73, column: 10, scope: !123)
!131 = !DILocation(line: 73, column: 19, scope: !123)
!132 = !DILocalVariable(name: "data", scope: !133, file: !12, line: 76, type: !16)
!133 = distinct !DILexicalBlock(scope: !109, file: !12, line: 75, column: 5)
!134 = !DILocation(line: 76, column: 19, scope: !133)
!135 = !DILocation(line: 76, column: 27, scope: !133)
!136 = !DILocation(line: 76, column: 26, scope: !133)
!137 = !DILocalVariable(name: "i", scope: !138, file: !12, line: 78, type: !53)
!138 = distinct !DILexicalBlock(scope: !133, file: !12, line: 77, column: 9)
!139 = !DILocation(line: 78, column: 20, scope: !138)
!140 = !DILocalVariable(name: "dest", scope: !138, file: !12, line: 79, type: !27)
!141 = !DILocation(line: 79, column: 21, scope: !138)
!142 = !DILocation(line: 80, column: 21, scope: !138)
!143 = !DILocation(line: 80, column: 13, scope: !138)
!144 = !DILocation(line: 81, column: 13, scope: !138)
!145 = !DILocation(line: 81, column: 25, scope: !138)
!146 = !DILocation(line: 83, column: 20, scope: !147)
!147 = distinct !DILexicalBlock(scope: !138, file: !12, line: 83, column: 13)
!148 = !DILocation(line: 83, column: 18, scope: !147)
!149 = !DILocation(line: 83, column: 25, scope: !150)
!150 = distinct !DILexicalBlock(scope: !147, file: !12, line: 83, column: 13)
!151 = !DILocation(line: 83, column: 27, scope: !150)
!152 = !DILocation(line: 83, column: 13, scope: !147)
!153 = !DILocation(line: 85, column: 27, scope: !154)
!154 = distinct !DILexicalBlock(scope: !150, file: !12, line: 84, column: 13)
!155 = !DILocation(line: 85, column: 32, scope: !154)
!156 = !DILocation(line: 85, column: 22, scope: !154)
!157 = !DILocation(line: 85, column: 17, scope: !154)
!158 = !DILocation(line: 85, column: 25, scope: !154)
!159 = !DILocation(line: 86, column: 13, scope: !154)
!160 = !DILocation(line: 83, column: 35, scope: !150)
!161 = !DILocation(line: 83, column: 13, scope: !150)
!162 = distinct !{!162, !152, !163, !80}
!163 = !DILocation(line: 86, column: 13, scope: !147)
!164 = !DILocation(line: 88, column: 13, scope: !138)
!165 = !DILocation(line: 88, column: 25, scope: !138)
!166 = !DILocation(line: 89, column: 24, scope: !138)
!167 = !DILocation(line: 89, column: 13, scope: !138)
!168 = !DILocation(line: 92, column: 1, scope: !109)
