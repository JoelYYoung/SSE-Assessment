; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_alloca_loop_32.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_alloca_loop_32.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__wchar_t_alloca_loop_32_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  %dataPtr1 = alloca i32**, align 8
  %dataPtr2 = alloca i32**, align 8
  %dataBuffer = alloca i32*, align 8
  %data1 = alloca i32*, align 8
  %data2 = alloca i32*, align 8
  %i = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32*** %dataPtr1, metadata !21, metadata !DIExpression()), !dbg !23
  store i32** %data, i32*** %dataPtr1, align 8, !dbg !23
  call void @llvm.dbg.declare(metadata i32*** %dataPtr2, metadata !24, metadata !DIExpression()), !dbg !25
  store i32** %data, i32*** %dataPtr2, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !26, metadata !DIExpression()), !dbg !27
  %0 = alloca i8, i64 400, align 16, !dbg !28
  %1 = bitcast i8* %0 to i32*, !dbg !29
  store i32* %1, i32** %dataBuffer, align 8, !dbg !27
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !30
  %call = call i32* @wmemset(i32* %2, i32 65, i64 99) #4, !dbg !31
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !32
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !32
  store i32 0, i32* %arrayidx, align 4, !dbg !33
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !34, metadata !DIExpression()), !dbg !36
  %4 = load i32**, i32*** %dataPtr1, align 8, !dbg !37
  %5 = load i32*, i32** %4, align 8, !dbg !38
  store i32* %5, i32** %data1, align 8, !dbg !36
  %6 = load i32*, i32** %dataBuffer, align 8, !dbg !39
  %add.ptr = getelementptr inbounds i32, i32* %6, i64 -8, !dbg !40
  store i32* %add.ptr, i32** %data1, align 8, !dbg !41
  %7 = load i32*, i32** %data1, align 8, !dbg !42
  %8 = load i32**, i32*** %dataPtr1, align 8, !dbg !43
  store i32* %7, i32** %8, align 8, !dbg !44
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !45, metadata !DIExpression()), !dbg !47
  %9 = load i32**, i32*** %dataPtr2, align 8, !dbg !48
  %10 = load i32*, i32** %9, align 8, !dbg !49
  store i32* %10, i32** %data2, align 8, !dbg !47
  call void @llvm.dbg.declare(metadata i64* %i, metadata !50, metadata !DIExpression()), !dbg !54
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !55, metadata !DIExpression()), !dbg !59
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !60
  %call3 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !61
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !62
  store i32 0, i32* %arrayidx4, align 4, !dbg !63
  store i64 0, i64* %i, align 8, !dbg !64
  br label %for.cond, !dbg !66

for.cond:                                         ; preds = %for.inc, %entry
  %11 = load i64, i64* %i, align 8, !dbg !67
  %cmp = icmp ult i64 %11, 100, !dbg !69
  br i1 %cmp, label %for.body, label %for.end, !dbg !70

for.body:                                         ; preds = %for.cond
  %12 = load i32*, i32** %data2, align 8, !dbg !71
  %13 = load i64, i64* %i, align 8, !dbg !73
  %arrayidx5 = getelementptr inbounds i32, i32* %12, i64 %13, !dbg !71
  %14 = load i32, i32* %arrayidx5, align 4, !dbg !71
  %15 = load i64, i64* %i, align 8, !dbg !74
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %15, !dbg !75
  store i32 %14, i32* %arrayidx6, align 4, !dbg !76
  br label %for.inc, !dbg !77

for.inc:                                          ; preds = %for.body
  %16 = load i64, i64* %i, align 8, !dbg !78
  %inc = add i64 %16, 1, !dbg !78
  store i64 %inc, i64* %i, align 8, !dbg !78
  br label %for.cond, !dbg !79, !llvm.loop !80

for.end:                                          ; preds = %for.cond
  %arrayidx7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !83
  store i32 0, i32* %arrayidx7, align 4, !dbg !84
  %arraydecay8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !85
  call void @printWLine(i32* %arraydecay8), !dbg !86
  ret void, !dbg !87
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__wchar_t_alloca_loop_32_good() #0 !dbg !88 {
entry:
  call void @goodG2B(), !dbg !89
  ret void, !dbg !90
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !91 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !97, metadata !DIExpression()), !dbg !98
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !99, metadata !DIExpression()), !dbg !100
  %call = call i64 @time(i64* null) #4, !dbg !101
  %conv = trunc i64 %call to i32, !dbg !102
  call void @srand(i32 %conv) #4, !dbg !103
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !104
  call void @CWE127_Buffer_Underread__wchar_t_alloca_loop_32_good(), !dbg !105
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !106
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !107
  call void @CWE127_Buffer_Underread__wchar_t_alloca_loop_32_bad(), !dbg !108
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !109
  ret i32 0, !dbg !110
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !111 {
entry:
  %data = alloca i32*, align 8
  %dataPtr1 = alloca i32**, align 8
  %dataPtr2 = alloca i32**, align 8
  %dataBuffer = alloca i32*, align 8
  %data1 = alloca i32*, align 8
  %data2 = alloca i32*, align 8
  %i = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !112, metadata !DIExpression()), !dbg !113
  call void @llvm.dbg.declare(metadata i32*** %dataPtr1, metadata !114, metadata !DIExpression()), !dbg !115
  store i32** %data, i32*** %dataPtr1, align 8, !dbg !115
  call void @llvm.dbg.declare(metadata i32*** %dataPtr2, metadata !116, metadata !DIExpression()), !dbg !117
  store i32** %data, i32*** %dataPtr2, align 8, !dbg !117
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !118, metadata !DIExpression()), !dbg !119
  %0 = alloca i8, i64 400, align 16, !dbg !120
  %1 = bitcast i8* %0 to i32*, !dbg !121
  store i32* %1, i32** %dataBuffer, align 8, !dbg !119
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !122
  %call = call i32* @wmemset(i32* %2, i32 65, i64 99) #4, !dbg !123
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !124
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !124
  store i32 0, i32* %arrayidx, align 4, !dbg !125
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !126, metadata !DIExpression()), !dbg !128
  %4 = load i32**, i32*** %dataPtr1, align 8, !dbg !129
  %5 = load i32*, i32** %4, align 8, !dbg !130
  store i32* %5, i32** %data1, align 8, !dbg !128
  %6 = load i32*, i32** %dataBuffer, align 8, !dbg !131
  store i32* %6, i32** %data1, align 8, !dbg !132
  %7 = load i32*, i32** %data1, align 8, !dbg !133
  %8 = load i32**, i32*** %dataPtr1, align 8, !dbg !134
  store i32* %7, i32** %8, align 8, !dbg !135
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !136, metadata !DIExpression()), !dbg !138
  %9 = load i32**, i32*** %dataPtr2, align 8, !dbg !139
  %10 = load i32*, i32** %9, align 8, !dbg !140
  store i32* %10, i32** %data2, align 8, !dbg !138
  call void @llvm.dbg.declare(metadata i64* %i, metadata !141, metadata !DIExpression()), !dbg !143
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !144, metadata !DIExpression()), !dbg !145
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !146
  %call3 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !147
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !148
  store i32 0, i32* %arrayidx4, align 4, !dbg !149
  store i64 0, i64* %i, align 8, !dbg !150
  br label %for.cond, !dbg !152

for.cond:                                         ; preds = %for.inc, %entry
  %11 = load i64, i64* %i, align 8, !dbg !153
  %cmp = icmp ult i64 %11, 100, !dbg !155
  br i1 %cmp, label %for.body, label %for.end, !dbg !156

for.body:                                         ; preds = %for.cond
  %12 = load i32*, i32** %data2, align 8, !dbg !157
  %13 = load i64, i64* %i, align 8, !dbg !159
  %arrayidx5 = getelementptr inbounds i32, i32* %12, i64 %13, !dbg !157
  %14 = load i32, i32* %arrayidx5, align 4, !dbg !157
  %15 = load i64, i64* %i, align 8, !dbg !160
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %15, !dbg !161
  store i32 %14, i32* %arrayidx6, align 4, !dbg !162
  br label %for.inc, !dbg !163

for.inc:                                          ; preds = %for.body
  %16 = load i64, i64* %i, align 8, !dbg !164
  %inc = add i64 %16, 1, !dbg !164
  store i64 %inc, i64* %i, align 8, !dbg !164
  br label %for.cond, !dbg !165, !llvm.loop !166

for.end:                                          ; preds = %for.cond
  %arrayidx7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !168
  store i32 0, i32* %arrayidx7, align 4, !dbg !169
  %arraydecay8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !170
  call void @printWLine(i32* %arraydecay8), !dbg !171
  ret void, !dbg !172
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_alloca_loop_32.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !8}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !6, line: 74, baseType: !7)
!6 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{i32 7, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{i32 1, !"wchar_size", i32 4}
!12 = !{i32 7, !"uwtable", i32 1}
!13 = !{i32 7, !"frame-pointer", i32 2}
!14 = !{!"clang version 13.0.0"}
!15 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__wchar_t_alloca_loop_32_bad", scope: !16, file: !16, line: 23, type: !17, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_alloca_loop_32.c", directory: "/home/joelyang/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 25, type: !4)
!20 = !DILocation(line: 25, column: 15, scope: !15)
!21 = !DILocalVariable(name: "dataPtr1", scope: !15, file: !16, line: 26, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!23 = !DILocation(line: 26, column: 16, scope: !15)
!24 = !DILocalVariable(name: "dataPtr2", scope: !15, file: !16, line: 27, type: !22)
!25 = !DILocation(line: 27, column: 16, scope: !15)
!26 = !DILocalVariable(name: "dataBuffer", scope: !15, file: !16, line: 28, type: !4)
!27 = !DILocation(line: 28, column: 15, scope: !15)
!28 = !DILocation(line: 28, column: 39, scope: !15)
!29 = !DILocation(line: 28, column: 28, scope: !15)
!30 = !DILocation(line: 29, column: 13, scope: !15)
!31 = !DILocation(line: 29, column: 5, scope: !15)
!32 = !DILocation(line: 30, column: 5, scope: !15)
!33 = !DILocation(line: 30, column: 23, scope: !15)
!34 = !DILocalVariable(name: "data", scope: !35, file: !16, line: 32, type: !4)
!35 = distinct !DILexicalBlock(scope: !15, file: !16, line: 31, column: 5)
!36 = !DILocation(line: 32, column: 19, scope: !35)
!37 = !DILocation(line: 32, column: 27, scope: !35)
!38 = !DILocation(line: 32, column: 26, scope: !35)
!39 = !DILocation(line: 34, column: 16, scope: !35)
!40 = !DILocation(line: 34, column: 27, scope: !35)
!41 = !DILocation(line: 34, column: 14, scope: !35)
!42 = !DILocation(line: 35, column: 21, scope: !35)
!43 = !DILocation(line: 35, column: 10, scope: !35)
!44 = !DILocation(line: 35, column: 19, scope: !35)
!45 = !DILocalVariable(name: "data", scope: !46, file: !16, line: 38, type: !4)
!46 = distinct !DILexicalBlock(scope: !15, file: !16, line: 37, column: 5)
!47 = !DILocation(line: 38, column: 19, scope: !46)
!48 = !DILocation(line: 38, column: 27, scope: !46)
!49 = !DILocation(line: 38, column: 26, scope: !46)
!50 = !DILocalVariable(name: "i", scope: !51, file: !16, line: 40, type: !52)
!51 = distinct !DILexicalBlock(scope: !46, file: !16, line: 39, column: 9)
!52 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !6, line: 46, baseType: !53)
!53 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!54 = !DILocation(line: 40, column: 20, scope: !51)
!55 = !DILocalVariable(name: "dest", scope: !51, file: !16, line: 41, type: !56)
!56 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !57)
!57 = !{!58}
!58 = !DISubrange(count: 100)
!59 = !DILocation(line: 41, column: 21, scope: !51)
!60 = !DILocation(line: 42, column: 21, scope: !51)
!61 = !DILocation(line: 42, column: 13, scope: !51)
!62 = !DILocation(line: 43, column: 13, scope: !51)
!63 = !DILocation(line: 43, column: 25, scope: !51)
!64 = !DILocation(line: 45, column: 20, scope: !65)
!65 = distinct !DILexicalBlock(scope: !51, file: !16, line: 45, column: 13)
!66 = !DILocation(line: 45, column: 18, scope: !65)
!67 = !DILocation(line: 45, column: 25, scope: !68)
!68 = distinct !DILexicalBlock(scope: !65, file: !16, line: 45, column: 13)
!69 = !DILocation(line: 45, column: 27, scope: !68)
!70 = !DILocation(line: 45, column: 13, scope: !65)
!71 = !DILocation(line: 47, column: 27, scope: !72)
!72 = distinct !DILexicalBlock(scope: !68, file: !16, line: 46, column: 13)
!73 = !DILocation(line: 47, column: 32, scope: !72)
!74 = !DILocation(line: 47, column: 22, scope: !72)
!75 = !DILocation(line: 47, column: 17, scope: !72)
!76 = !DILocation(line: 47, column: 25, scope: !72)
!77 = !DILocation(line: 48, column: 13, scope: !72)
!78 = !DILocation(line: 45, column: 35, scope: !68)
!79 = !DILocation(line: 45, column: 13, scope: !68)
!80 = distinct !{!80, !70, !81, !82}
!81 = !DILocation(line: 48, column: 13, scope: !65)
!82 = !{!"llvm.loop.mustprogress"}
!83 = !DILocation(line: 50, column: 13, scope: !51)
!84 = !DILocation(line: 50, column: 25, scope: !51)
!85 = !DILocation(line: 51, column: 24, scope: !51)
!86 = !DILocation(line: 51, column: 13, scope: !51)
!87 = !DILocation(line: 54, column: 1, scope: !15)
!88 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__wchar_t_alloca_loop_32_good", scope: !16, file: !16, line: 94, type: !17, scopeLine: 95, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!89 = !DILocation(line: 96, column: 5, scope: !88)
!90 = !DILocation(line: 97, column: 1, scope: !88)
!91 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 108, type: !92, scopeLine: 109, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!92 = !DISubroutineType(types: !93)
!93 = !{!7, !7, !94}
!94 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !95, size: 64)
!95 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !96, size: 64)
!96 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!97 = !DILocalVariable(name: "argc", arg: 1, scope: !91, file: !16, line: 108, type: !7)
!98 = !DILocation(line: 108, column: 14, scope: !91)
!99 = !DILocalVariable(name: "argv", arg: 2, scope: !91, file: !16, line: 108, type: !94)
!100 = !DILocation(line: 108, column: 27, scope: !91)
!101 = !DILocation(line: 111, column: 22, scope: !91)
!102 = !DILocation(line: 111, column: 12, scope: !91)
!103 = !DILocation(line: 111, column: 5, scope: !91)
!104 = !DILocation(line: 113, column: 5, scope: !91)
!105 = !DILocation(line: 114, column: 5, scope: !91)
!106 = !DILocation(line: 115, column: 5, scope: !91)
!107 = !DILocation(line: 118, column: 5, scope: !91)
!108 = !DILocation(line: 119, column: 5, scope: !91)
!109 = !DILocation(line: 120, column: 5, scope: !91)
!110 = !DILocation(line: 122, column: 5, scope: !91)
!111 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 61, type: !17, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!112 = !DILocalVariable(name: "data", scope: !111, file: !16, line: 63, type: !4)
!113 = !DILocation(line: 63, column: 15, scope: !111)
!114 = !DILocalVariable(name: "dataPtr1", scope: !111, file: !16, line: 64, type: !22)
!115 = !DILocation(line: 64, column: 16, scope: !111)
!116 = !DILocalVariable(name: "dataPtr2", scope: !111, file: !16, line: 65, type: !22)
!117 = !DILocation(line: 65, column: 16, scope: !111)
!118 = !DILocalVariable(name: "dataBuffer", scope: !111, file: !16, line: 66, type: !4)
!119 = !DILocation(line: 66, column: 15, scope: !111)
!120 = !DILocation(line: 66, column: 39, scope: !111)
!121 = !DILocation(line: 66, column: 28, scope: !111)
!122 = !DILocation(line: 67, column: 13, scope: !111)
!123 = !DILocation(line: 67, column: 5, scope: !111)
!124 = !DILocation(line: 68, column: 5, scope: !111)
!125 = !DILocation(line: 68, column: 23, scope: !111)
!126 = !DILocalVariable(name: "data", scope: !127, file: !16, line: 70, type: !4)
!127 = distinct !DILexicalBlock(scope: !111, file: !16, line: 69, column: 5)
!128 = !DILocation(line: 70, column: 19, scope: !127)
!129 = !DILocation(line: 70, column: 27, scope: !127)
!130 = !DILocation(line: 70, column: 26, scope: !127)
!131 = !DILocation(line: 72, column: 16, scope: !127)
!132 = !DILocation(line: 72, column: 14, scope: !127)
!133 = !DILocation(line: 73, column: 21, scope: !127)
!134 = !DILocation(line: 73, column: 10, scope: !127)
!135 = !DILocation(line: 73, column: 19, scope: !127)
!136 = !DILocalVariable(name: "data", scope: !137, file: !16, line: 76, type: !4)
!137 = distinct !DILexicalBlock(scope: !111, file: !16, line: 75, column: 5)
!138 = !DILocation(line: 76, column: 19, scope: !137)
!139 = !DILocation(line: 76, column: 27, scope: !137)
!140 = !DILocation(line: 76, column: 26, scope: !137)
!141 = !DILocalVariable(name: "i", scope: !142, file: !16, line: 78, type: !52)
!142 = distinct !DILexicalBlock(scope: !137, file: !16, line: 77, column: 9)
!143 = !DILocation(line: 78, column: 20, scope: !142)
!144 = !DILocalVariable(name: "dest", scope: !142, file: !16, line: 79, type: !56)
!145 = !DILocation(line: 79, column: 21, scope: !142)
!146 = !DILocation(line: 80, column: 21, scope: !142)
!147 = !DILocation(line: 80, column: 13, scope: !142)
!148 = !DILocation(line: 81, column: 13, scope: !142)
!149 = !DILocation(line: 81, column: 25, scope: !142)
!150 = !DILocation(line: 83, column: 20, scope: !151)
!151 = distinct !DILexicalBlock(scope: !142, file: !16, line: 83, column: 13)
!152 = !DILocation(line: 83, column: 18, scope: !151)
!153 = !DILocation(line: 83, column: 25, scope: !154)
!154 = distinct !DILexicalBlock(scope: !151, file: !16, line: 83, column: 13)
!155 = !DILocation(line: 83, column: 27, scope: !154)
!156 = !DILocation(line: 83, column: 13, scope: !151)
!157 = !DILocation(line: 85, column: 27, scope: !158)
!158 = distinct !DILexicalBlock(scope: !154, file: !16, line: 84, column: 13)
!159 = !DILocation(line: 85, column: 32, scope: !158)
!160 = !DILocation(line: 85, column: 22, scope: !158)
!161 = !DILocation(line: 85, column: 17, scope: !158)
!162 = !DILocation(line: 85, column: 25, scope: !158)
!163 = !DILocation(line: 86, column: 13, scope: !158)
!164 = !DILocation(line: 83, column: 35, scope: !154)
!165 = !DILocation(line: 83, column: 13, scope: !154)
!166 = distinct !{!166, !156, !167, !82}
!167 = !DILocation(line: 86, column: 13, scope: !151)
!168 = !DILocation(line: 88, column: 13, scope: !142)
!169 = !DILocation(line: 88, column: 25, scope: !142)
!170 = !DILocation(line: 89, column: 24, scope: !142)
!171 = !DILocation(line: 89, column: 13, scope: !142)
!172 = !DILocation(line: 92, column: 1, scope: !111)
