; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_alloca_loop_34.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_alloca_loop_34.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.CWE127_Buffer_Underread__wchar_t_alloca_loop_34_unionType = type { i32* }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__wchar_t_alloca_loop_34_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  %myUnion = alloca %union.CWE127_Buffer_Underread__wchar_t_alloca_loop_34_unionType, align 8
  %dataBuffer = alloca i32*, align 8
  %data1 = alloca i32*, align 8
  %i = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata %union.CWE127_Buffer_Underread__wchar_t_alloca_loop_34_unionType* %myUnion, metadata !21, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !28, metadata !DIExpression()), !dbg !29
  %0 = alloca i8, i64 400, align 16, !dbg !30
  %1 = bitcast i8* %0 to i32*, !dbg !31
  store i32* %1, i32** %dataBuffer, align 8, !dbg !29
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !32
  %call = call i32* @wmemset(i32* %2, i32 65, i64 99) #4, !dbg !33
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !34
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !34
  store i32 0, i32* %arrayidx, align 4, !dbg !35
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !36
  %add.ptr = getelementptr inbounds i32, i32* %4, i64 -8, !dbg !37
  store i32* %add.ptr, i32** %data, align 8, !dbg !38
  %5 = load i32*, i32** %data, align 8, !dbg !39
  %unionFirst = bitcast %union.CWE127_Buffer_Underread__wchar_t_alloca_loop_34_unionType* %myUnion to i32**, !dbg !40
  store i32* %5, i32** %unionFirst, align 8, !dbg !41
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !42, metadata !DIExpression()), !dbg !44
  %unionSecond = bitcast %union.CWE127_Buffer_Underread__wchar_t_alloca_loop_34_unionType* %myUnion to i32**, !dbg !45
  %6 = load i32*, i32** %unionSecond, align 8, !dbg !45
  store i32* %6, i32** %data1, align 8, !dbg !44
  call void @llvm.dbg.declare(metadata i64* %i, metadata !46, metadata !DIExpression()), !dbg !50
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !51, metadata !DIExpression()), !dbg !55
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !56
  %call2 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !57
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !58
  store i32 0, i32* %arrayidx3, align 4, !dbg !59
  store i64 0, i64* %i, align 8, !dbg !60
  br label %for.cond, !dbg !62

for.cond:                                         ; preds = %for.inc, %entry
  %7 = load i64, i64* %i, align 8, !dbg !63
  %cmp = icmp ult i64 %7, 100, !dbg !65
  br i1 %cmp, label %for.body, label %for.end, !dbg !66

for.body:                                         ; preds = %for.cond
  %8 = load i32*, i32** %data1, align 8, !dbg !67
  %9 = load i64, i64* %i, align 8, !dbg !69
  %arrayidx4 = getelementptr inbounds i32, i32* %8, i64 %9, !dbg !67
  %10 = load i32, i32* %arrayidx4, align 4, !dbg !67
  %11 = load i64, i64* %i, align 8, !dbg !70
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %11, !dbg !71
  store i32 %10, i32* %arrayidx5, align 4, !dbg !72
  br label %for.inc, !dbg !73

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !74
  %inc = add i64 %12, 1, !dbg !74
  store i64 %inc, i64* %i, align 8, !dbg !74
  br label %for.cond, !dbg !75, !llvm.loop !76

for.end:                                          ; preds = %for.cond
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !79
  store i32 0, i32* %arrayidx6, align 4, !dbg !80
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !81
  call void @printWLine(i32* %arraydecay7), !dbg !82
  ret void, !dbg !83
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__wchar_t_alloca_loop_34_good() #0 !dbg !84 {
entry:
  call void @goodG2B(), !dbg !85
  ret void, !dbg !86
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !87 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !93, metadata !DIExpression()), !dbg !94
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !95, metadata !DIExpression()), !dbg !96
  %call = call i64 @time(i64* null) #4, !dbg !97
  %conv = trunc i64 %call to i32, !dbg !98
  call void @srand(i32 %conv) #4, !dbg !99
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !100
  call void @CWE127_Buffer_Underread__wchar_t_alloca_loop_34_good(), !dbg !101
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !102
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !103
  call void @CWE127_Buffer_Underread__wchar_t_alloca_loop_34_bad(), !dbg !104
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !105
  ret i32 0, !dbg !106
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !107 {
entry:
  %data = alloca i32*, align 8
  %myUnion = alloca %union.CWE127_Buffer_Underread__wchar_t_alloca_loop_34_unionType, align 8
  %dataBuffer = alloca i32*, align 8
  %data1 = alloca i32*, align 8
  %i = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !108, metadata !DIExpression()), !dbg !109
  call void @llvm.dbg.declare(metadata %union.CWE127_Buffer_Underread__wchar_t_alloca_loop_34_unionType* %myUnion, metadata !110, metadata !DIExpression()), !dbg !111
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !112, metadata !DIExpression()), !dbg !113
  %0 = alloca i8, i64 400, align 16, !dbg !114
  %1 = bitcast i8* %0 to i32*, !dbg !115
  store i32* %1, i32** %dataBuffer, align 8, !dbg !113
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !116
  %call = call i32* @wmemset(i32* %2, i32 65, i64 99) #4, !dbg !117
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !118
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !118
  store i32 0, i32* %arrayidx, align 4, !dbg !119
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !120
  store i32* %4, i32** %data, align 8, !dbg !121
  %5 = load i32*, i32** %data, align 8, !dbg !122
  %unionFirst = bitcast %union.CWE127_Buffer_Underread__wchar_t_alloca_loop_34_unionType* %myUnion to i32**, !dbg !123
  store i32* %5, i32** %unionFirst, align 8, !dbg !124
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !125, metadata !DIExpression()), !dbg !127
  %unionSecond = bitcast %union.CWE127_Buffer_Underread__wchar_t_alloca_loop_34_unionType* %myUnion to i32**, !dbg !128
  %6 = load i32*, i32** %unionSecond, align 8, !dbg !128
  store i32* %6, i32** %data1, align 8, !dbg !127
  call void @llvm.dbg.declare(metadata i64* %i, metadata !129, metadata !DIExpression()), !dbg !131
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !132, metadata !DIExpression()), !dbg !133
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !134
  %call2 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !135
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !136
  store i32 0, i32* %arrayidx3, align 4, !dbg !137
  store i64 0, i64* %i, align 8, !dbg !138
  br label %for.cond, !dbg !140

for.cond:                                         ; preds = %for.inc, %entry
  %7 = load i64, i64* %i, align 8, !dbg !141
  %cmp = icmp ult i64 %7, 100, !dbg !143
  br i1 %cmp, label %for.body, label %for.end, !dbg !144

for.body:                                         ; preds = %for.cond
  %8 = load i32*, i32** %data1, align 8, !dbg !145
  %9 = load i64, i64* %i, align 8, !dbg !147
  %arrayidx4 = getelementptr inbounds i32, i32* %8, i64 %9, !dbg !145
  %10 = load i32, i32* %arrayidx4, align 4, !dbg !145
  %11 = load i64, i64* %i, align 8, !dbg !148
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %11, !dbg !149
  store i32 %10, i32* %arrayidx5, align 4, !dbg !150
  br label %for.inc, !dbg !151

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !152
  %inc = add i64 %12, 1, !dbg !152
  store i64 %inc, i64* %i, align 8, !dbg !152
  br label %for.cond, !dbg !153, !llvm.loop !154

for.end:                                          ; preds = %for.cond
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !156
  store i32 0, i32* %arrayidx6, align 4, !dbg !157
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !158
  call void @printWLine(i32* %arraydecay7), !dbg !159
  ret void, !dbg !160
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_alloca_loop_34.c", directory: "/home/joelyang/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__wchar_t_alloca_loop_34_bad", scope: !16, file: !16, line: 29, type: !17, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_alloca_loop_34.c", directory: "/home/joelyang/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 31, type: !4)
!20 = !DILocation(line: 31, column: 15, scope: !15)
!21 = !DILocalVariable(name: "myUnion", scope: !15, file: !16, line: 32, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE127_Buffer_Underread__wchar_t_alloca_loop_34_unionType", file: !16, line: 25, baseType: !23)
!23 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !16, line: 21, size: 64, elements: !24)
!24 = !{!25, !26}
!25 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !23, file: !16, line: 23, baseType: !4, size: 64)
!26 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !23, file: !16, line: 24, baseType: !4, size: 64)
!27 = !DILocation(line: 32, column: 63, scope: !15)
!28 = !DILocalVariable(name: "dataBuffer", scope: !15, file: !16, line: 33, type: !4)
!29 = !DILocation(line: 33, column: 15, scope: !15)
!30 = !DILocation(line: 33, column: 39, scope: !15)
!31 = !DILocation(line: 33, column: 28, scope: !15)
!32 = !DILocation(line: 34, column: 13, scope: !15)
!33 = !DILocation(line: 34, column: 5, scope: !15)
!34 = !DILocation(line: 35, column: 5, scope: !15)
!35 = !DILocation(line: 35, column: 23, scope: !15)
!36 = !DILocation(line: 37, column: 12, scope: !15)
!37 = !DILocation(line: 37, column: 23, scope: !15)
!38 = !DILocation(line: 37, column: 10, scope: !15)
!39 = !DILocation(line: 38, column: 26, scope: !15)
!40 = !DILocation(line: 38, column: 13, scope: !15)
!41 = !DILocation(line: 38, column: 24, scope: !15)
!42 = !DILocalVariable(name: "data", scope: !43, file: !16, line: 40, type: !4)
!43 = distinct !DILexicalBlock(scope: !15, file: !16, line: 39, column: 5)
!44 = !DILocation(line: 40, column: 19, scope: !43)
!45 = !DILocation(line: 40, column: 34, scope: !43)
!46 = !DILocalVariable(name: "i", scope: !47, file: !16, line: 42, type: !48)
!47 = distinct !DILexicalBlock(scope: !43, file: !16, line: 41, column: 9)
!48 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !6, line: 46, baseType: !49)
!49 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!50 = !DILocation(line: 42, column: 20, scope: !47)
!51 = !DILocalVariable(name: "dest", scope: !47, file: !16, line: 43, type: !52)
!52 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !53)
!53 = !{!54}
!54 = !DISubrange(count: 100)
!55 = !DILocation(line: 43, column: 21, scope: !47)
!56 = !DILocation(line: 44, column: 21, scope: !47)
!57 = !DILocation(line: 44, column: 13, scope: !47)
!58 = !DILocation(line: 45, column: 13, scope: !47)
!59 = !DILocation(line: 45, column: 25, scope: !47)
!60 = !DILocation(line: 47, column: 20, scope: !61)
!61 = distinct !DILexicalBlock(scope: !47, file: !16, line: 47, column: 13)
!62 = !DILocation(line: 47, column: 18, scope: !61)
!63 = !DILocation(line: 47, column: 25, scope: !64)
!64 = distinct !DILexicalBlock(scope: !61, file: !16, line: 47, column: 13)
!65 = !DILocation(line: 47, column: 27, scope: !64)
!66 = !DILocation(line: 47, column: 13, scope: !61)
!67 = !DILocation(line: 49, column: 27, scope: !68)
!68 = distinct !DILexicalBlock(scope: !64, file: !16, line: 48, column: 13)
!69 = !DILocation(line: 49, column: 32, scope: !68)
!70 = !DILocation(line: 49, column: 22, scope: !68)
!71 = !DILocation(line: 49, column: 17, scope: !68)
!72 = !DILocation(line: 49, column: 25, scope: !68)
!73 = !DILocation(line: 50, column: 13, scope: !68)
!74 = !DILocation(line: 47, column: 35, scope: !64)
!75 = !DILocation(line: 47, column: 13, scope: !64)
!76 = distinct !{!76, !66, !77, !78}
!77 = !DILocation(line: 50, column: 13, scope: !61)
!78 = !{!"llvm.loop.mustprogress"}
!79 = !DILocation(line: 52, column: 13, scope: !47)
!80 = !DILocation(line: 52, column: 25, scope: !47)
!81 = !DILocation(line: 53, column: 24, scope: !47)
!82 = !DILocation(line: 53, column: 13, scope: !47)
!83 = !DILocation(line: 56, column: 1, scope: !15)
!84 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__wchar_t_alloca_loop_34_good", scope: !16, file: !16, line: 92, type: !17, scopeLine: 93, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!85 = !DILocation(line: 94, column: 5, scope: !84)
!86 = !DILocation(line: 95, column: 1, scope: !84)
!87 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 106, type: !88, scopeLine: 107, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!88 = !DISubroutineType(types: !89)
!89 = !{!7, !7, !90}
!90 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !91, size: 64)
!91 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !92, size: 64)
!92 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!93 = !DILocalVariable(name: "argc", arg: 1, scope: !87, file: !16, line: 106, type: !7)
!94 = !DILocation(line: 106, column: 14, scope: !87)
!95 = !DILocalVariable(name: "argv", arg: 2, scope: !87, file: !16, line: 106, type: !90)
!96 = !DILocation(line: 106, column: 27, scope: !87)
!97 = !DILocation(line: 109, column: 22, scope: !87)
!98 = !DILocation(line: 109, column: 12, scope: !87)
!99 = !DILocation(line: 109, column: 5, scope: !87)
!100 = !DILocation(line: 111, column: 5, scope: !87)
!101 = !DILocation(line: 112, column: 5, scope: !87)
!102 = !DILocation(line: 113, column: 5, scope: !87)
!103 = !DILocation(line: 116, column: 5, scope: !87)
!104 = !DILocation(line: 117, column: 5, scope: !87)
!105 = !DILocation(line: 118, column: 5, scope: !87)
!106 = !DILocation(line: 120, column: 5, scope: !87)
!107 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 63, type: !17, scopeLine: 64, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!108 = !DILocalVariable(name: "data", scope: !107, file: !16, line: 65, type: !4)
!109 = !DILocation(line: 65, column: 15, scope: !107)
!110 = !DILocalVariable(name: "myUnion", scope: !107, file: !16, line: 66, type: !22)
!111 = !DILocation(line: 66, column: 63, scope: !107)
!112 = !DILocalVariable(name: "dataBuffer", scope: !107, file: !16, line: 67, type: !4)
!113 = !DILocation(line: 67, column: 15, scope: !107)
!114 = !DILocation(line: 67, column: 39, scope: !107)
!115 = !DILocation(line: 67, column: 28, scope: !107)
!116 = !DILocation(line: 68, column: 13, scope: !107)
!117 = !DILocation(line: 68, column: 5, scope: !107)
!118 = !DILocation(line: 69, column: 5, scope: !107)
!119 = !DILocation(line: 69, column: 23, scope: !107)
!120 = !DILocation(line: 71, column: 12, scope: !107)
!121 = !DILocation(line: 71, column: 10, scope: !107)
!122 = !DILocation(line: 72, column: 26, scope: !107)
!123 = !DILocation(line: 72, column: 13, scope: !107)
!124 = !DILocation(line: 72, column: 24, scope: !107)
!125 = !DILocalVariable(name: "data", scope: !126, file: !16, line: 74, type: !4)
!126 = distinct !DILexicalBlock(scope: !107, file: !16, line: 73, column: 5)
!127 = !DILocation(line: 74, column: 19, scope: !126)
!128 = !DILocation(line: 74, column: 34, scope: !126)
!129 = !DILocalVariable(name: "i", scope: !130, file: !16, line: 76, type: !48)
!130 = distinct !DILexicalBlock(scope: !126, file: !16, line: 75, column: 9)
!131 = !DILocation(line: 76, column: 20, scope: !130)
!132 = !DILocalVariable(name: "dest", scope: !130, file: !16, line: 77, type: !52)
!133 = !DILocation(line: 77, column: 21, scope: !130)
!134 = !DILocation(line: 78, column: 21, scope: !130)
!135 = !DILocation(line: 78, column: 13, scope: !130)
!136 = !DILocation(line: 79, column: 13, scope: !130)
!137 = !DILocation(line: 79, column: 25, scope: !130)
!138 = !DILocation(line: 81, column: 20, scope: !139)
!139 = distinct !DILexicalBlock(scope: !130, file: !16, line: 81, column: 13)
!140 = !DILocation(line: 81, column: 18, scope: !139)
!141 = !DILocation(line: 81, column: 25, scope: !142)
!142 = distinct !DILexicalBlock(scope: !139, file: !16, line: 81, column: 13)
!143 = !DILocation(line: 81, column: 27, scope: !142)
!144 = !DILocation(line: 81, column: 13, scope: !139)
!145 = !DILocation(line: 83, column: 27, scope: !146)
!146 = distinct !DILexicalBlock(scope: !142, file: !16, line: 82, column: 13)
!147 = !DILocation(line: 83, column: 32, scope: !146)
!148 = !DILocation(line: 83, column: 22, scope: !146)
!149 = !DILocation(line: 83, column: 17, scope: !146)
!150 = !DILocation(line: 83, column: 25, scope: !146)
!151 = !DILocation(line: 84, column: 13, scope: !146)
!152 = !DILocation(line: 81, column: 35, scope: !142)
!153 = !DILocation(line: 81, column: 13, scope: !142)
!154 = distinct !{!154, !144, !155, !78}
!155 = !DILocation(line: 84, column: 13, scope: !139)
!156 = !DILocation(line: 86, column: 13, scope: !130)
!157 = !DILocation(line: 86, column: 25, scope: !130)
!158 = !DILocation(line: 87, column: 24, scope: !130)
!159 = !DILocation(line: 87, column: 13, scope: !130)
!160 = !DILocation(line: 90, column: 1, scope: !107)
