; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_declare_loop_34.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_declare_loop_34.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.CWE127_Buffer_Underread__wchar_t_declare_loop_34_unionType = type { i32* }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__wchar_t_declare_loop_34_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %myUnion = alloca %union.CWE127_Buffer_Underread__wchar_t_declare_loop_34_unionType, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %data2 = alloca i32*, align 8
  %i = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata %union.CWE127_Buffer_Underread__wchar_t_declare_loop_34_unionType* %myUnion, metadata !21, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !28, metadata !DIExpression()), !dbg !32
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !33
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 99) #4, !dbg !34
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 99, !dbg !35
  store i32 0, i32* %arrayidx, align 4, !dbg !36
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !37
  %add.ptr = getelementptr inbounds i32, i32* %arraydecay1, i64 -8, !dbg !38
  store i32* %add.ptr, i32** %data, align 8, !dbg !39
  %0 = load i32*, i32** %data, align 8, !dbg !40
  %unionFirst = bitcast %union.CWE127_Buffer_Underread__wchar_t_declare_loop_34_unionType* %myUnion to i32**, !dbg !41
  store i32* %0, i32** %unionFirst, align 8, !dbg !42
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !43, metadata !DIExpression()), !dbg !45
  %unionSecond = bitcast %union.CWE127_Buffer_Underread__wchar_t_declare_loop_34_unionType* %myUnion to i32**, !dbg !46
  %1 = load i32*, i32** %unionSecond, align 8, !dbg !46
  store i32* %1, i32** %data2, align 8, !dbg !45
  call void @llvm.dbg.declare(metadata i64* %i, metadata !47, metadata !DIExpression()), !dbg !51
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !52, metadata !DIExpression()), !dbg !53
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !54
  %call4 = call i32* @wmemset(i32* %arraydecay3, i32 67, i64 99) #4, !dbg !55
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !56
  store i32 0, i32* %arrayidx5, align 4, !dbg !57
  store i64 0, i64* %i, align 8, !dbg !58
  br label %for.cond, !dbg !60

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !61
  %cmp = icmp ult i64 %2, 100, !dbg !63
  br i1 %cmp, label %for.body, label %for.end, !dbg !64

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %data2, align 8, !dbg !65
  %4 = load i64, i64* %i, align 8, !dbg !67
  %arrayidx6 = getelementptr inbounds i32, i32* %3, i64 %4, !dbg !65
  %5 = load i32, i32* %arrayidx6, align 4, !dbg !65
  %6 = load i64, i64* %i, align 8, !dbg !68
  %arrayidx7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %6, !dbg !69
  store i32 %5, i32* %arrayidx7, align 4, !dbg !70
  br label %for.inc, !dbg !71

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !72
  %inc = add i64 %7, 1, !dbg !72
  store i64 %inc, i64* %i, align 8, !dbg !72
  br label %for.cond, !dbg !73, !llvm.loop !74

for.end:                                          ; preds = %for.cond
  %arrayidx8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !77
  store i32 0, i32* %arrayidx8, align 4, !dbg !78
  %arraydecay9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !79
  call void @printWLine(i32* %arraydecay9), !dbg !80
  ret void, !dbg !81
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__wchar_t_declare_loop_34_good() #0 !dbg !82 {
entry:
  call void @goodG2B(), !dbg !83
  ret void, !dbg !84
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !85 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !91, metadata !DIExpression()), !dbg !92
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !93, metadata !DIExpression()), !dbg !94
  %call = call i64 @time(i64* null) #4, !dbg !95
  %conv = trunc i64 %call to i32, !dbg !96
  call void @srand(i32 %conv) #4, !dbg !97
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !98
  call void @CWE127_Buffer_Underread__wchar_t_declare_loop_34_good(), !dbg !99
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !100
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !101
  call void @CWE127_Buffer_Underread__wchar_t_declare_loop_34_bad(), !dbg !102
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !103
  ret i32 0, !dbg !104
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !105 {
entry:
  %data = alloca i32*, align 8
  %myUnion = alloca %union.CWE127_Buffer_Underread__wchar_t_declare_loop_34_unionType, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %data2 = alloca i32*, align 8
  %i = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !106, metadata !DIExpression()), !dbg !107
  call void @llvm.dbg.declare(metadata %union.CWE127_Buffer_Underread__wchar_t_declare_loop_34_unionType* %myUnion, metadata !108, metadata !DIExpression()), !dbg !109
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !110, metadata !DIExpression()), !dbg !111
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !112
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 99) #4, !dbg !113
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 99, !dbg !114
  store i32 0, i32* %arrayidx, align 4, !dbg !115
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !116
  store i32* %arraydecay1, i32** %data, align 8, !dbg !117
  %0 = load i32*, i32** %data, align 8, !dbg !118
  %unionFirst = bitcast %union.CWE127_Buffer_Underread__wchar_t_declare_loop_34_unionType* %myUnion to i32**, !dbg !119
  store i32* %0, i32** %unionFirst, align 8, !dbg !120
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !121, metadata !DIExpression()), !dbg !123
  %unionSecond = bitcast %union.CWE127_Buffer_Underread__wchar_t_declare_loop_34_unionType* %myUnion to i32**, !dbg !124
  %1 = load i32*, i32** %unionSecond, align 8, !dbg !124
  store i32* %1, i32** %data2, align 8, !dbg !123
  call void @llvm.dbg.declare(metadata i64* %i, metadata !125, metadata !DIExpression()), !dbg !127
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !128, metadata !DIExpression()), !dbg !129
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !130
  %call4 = call i32* @wmemset(i32* %arraydecay3, i32 67, i64 99) #4, !dbg !131
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !132
  store i32 0, i32* %arrayidx5, align 4, !dbg !133
  store i64 0, i64* %i, align 8, !dbg !134
  br label %for.cond, !dbg !136

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !137
  %cmp = icmp ult i64 %2, 100, !dbg !139
  br i1 %cmp, label %for.body, label %for.end, !dbg !140

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %data2, align 8, !dbg !141
  %4 = load i64, i64* %i, align 8, !dbg !143
  %arrayidx6 = getelementptr inbounds i32, i32* %3, i64 %4, !dbg !141
  %5 = load i32, i32* %arrayidx6, align 4, !dbg !141
  %6 = load i64, i64* %i, align 8, !dbg !144
  %arrayidx7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %6, !dbg !145
  store i32 %5, i32* %arrayidx7, align 4, !dbg !146
  br label %for.inc, !dbg !147

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !148
  %inc = add i64 %7, 1, !dbg !148
  store i64 %inc, i64* %i, align 8, !dbg !148
  br label %for.cond, !dbg !149, !llvm.loop !150

for.end:                                          ; preds = %for.cond
  %arrayidx8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !152
  store i32 0, i32* %arrayidx8, align 4, !dbg !153
  %arraydecay9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !154
  call void @printWLine(i32* %arraydecay9), !dbg !155
  ret void, !dbg !156
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_declare_loop_34.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__wchar_t_declare_loop_34_bad", scope: !12, file: !12, line: 29, type: !13, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_declare_loop_34.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 31, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !18, line: 74, baseType: !19)
!18 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 31, column: 15, scope: !11)
!21 = !DILocalVariable(name: "myUnion", scope: !11, file: !12, line: 32, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE127_Buffer_Underread__wchar_t_declare_loop_34_unionType", file: !12, line: 25, baseType: !23)
!23 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !12, line: 21, size: 64, elements: !24)
!24 = !{!25, !26}
!25 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !23, file: !12, line: 23, baseType: !16, size: 64)
!26 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !23, file: !12, line: 24, baseType: !16, size: 64)
!27 = !DILocation(line: 32, column: 64, scope: !11)
!28 = !DILocalVariable(name: "dataBuffer", scope: !11, file: !12, line: 33, type: !29)
!29 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !30)
!30 = !{!31}
!31 = !DISubrange(count: 100)
!32 = !DILocation(line: 33, column: 13, scope: !11)
!33 = !DILocation(line: 34, column: 13, scope: !11)
!34 = !DILocation(line: 34, column: 5, scope: !11)
!35 = !DILocation(line: 35, column: 5, scope: !11)
!36 = !DILocation(line: 35, column: 23, scope: !11)
!37 = !DILocation(line: 37, column: 12, scope: !11)
!38 = !DILocation(line: 37, column: 23, scope: !11)
!39 = !DILocation(line: 37, column: 10, scope: !11)
!40 = !DILocation(line: 38, column: 26, scope: !11)
!41 = !DILocation(line: 38, column: 13, scope: !11)
!42 = !DILocation(line: 38, column: 24, scope: !11)
!43 = !DILocalVariable(name: "data", scope: !44, file: !12, line: 40, type: !16)
!44 = distinct !DILexicalBlock(scope: !11, file: !12, line: 39, column: 5)
!45 = !DILocation(line: 40, column: 19, scope: !44)
!46 = !DILocation(line: 40, column: 34, scope: !44)
!47 = !DILocalVariable(name: "i", scope: !48, file: !12, line: 42, type: !49)
!48 = distinct !DILexicalBlock(scope: !44, file: !12, line: 41, column: 9)
!49 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !18, line: 46, baseType: !50)
!50 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!51 = !DILocation(line: 42, column: 20, scope: !48)
!52 = !DILocalVariable(name: "dest", scope: !48, file: !12, line: 43, type: !29)
!53 = !DILocation(line: 43, column: 21, scope: !48)
!54 = !DILocation(line: 44, column: 21, scope: !48)
!55 = !DILocation(line: 44, column: 13, scope: !48)
!56 = !DILocation(line: 45, column: 13, scope: !48)
!57 = !DILocation(line: 45, column: 25, scope: !48)
!58 = !DILocation(line: 47, column: 20, scope: !59)
!59 = distinct !DILexicalBlock(scope: !48, file: !12, line: 47, column: 13)
!60 = !DILocation(line: 47, column: 18, scope: !59)
!61 = !DILocation(line: 47, column: 25, scope: !62)
!62 = distinct !DILexicalBlock(scope: !59, file: !12, line: 47, column: 13)
!63 = !DILocation(line: 47, column: 27, scope: !62)
!64 = !DILocation(line: 47, column: 13, scope: !59)
!65 = !DILocation(line: 49, column: 27, scope: !66)
!66 = distinct !DILexicalBlock(scope: !62, file: !12, line: 48, column: 13)
!67 = !DILocation(line: 49, column: 32, scope: !66)
!68 = !DILocation(line: 49, column: 22, scope: !66)
!69 = !DILocation(line: 49, column: 17, scope: !66)
!70 = !DILocation(line: 49, column: 25, scope: !66)
!71 = !DILocation(line: 50, column: 13, scope: !66)
!72 = !DILocation(line: 47, column: 35, scope: !62)
!73 = !DILocation(line: 47, column: 13, scope: !62)
!74 = distinct !{!74, !64, !75, !76}
!75 = !DILocation(line: 50, column: 13, scope: !59)
!76 = !{!"llvm.loop.mustprogress"}
!77 = !DILocation(line: 52, column: 13, scope: !48)
!78 = !DILocation(line: 52, column: 25, scope: !48)
!79 = !DILocation(line: 53, column: 24, scope: !48)
!80 = !DILocation(line: 53, column: 13, scope: !48)
!81 = !DILocation(line: 56, column: 1, scope: !11)
!82 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__wchar_t_declare_loop_34_good", scope: !12, file: !12, line: 92, type: !13, scopeLine: 93, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!83 = !DILocation(line: 94, column: 5, scope: !82)
!84 = !DILocation(line: 95, column: 1, scope: !82)
!85 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 106, type: !86, scopeLine: 107, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!86 = !DISubroutineType(types: !87)
!87 = !{!19, !19, !88}
!88 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !89, size: 64)
!89 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !90, size: 64)
!90 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!91 = !DILocalVariable(name: "argc", arg: 1, scope: !85, file: !12, line: 106, type: !19)
!92 = !DILocation(line: 106, column: 14, scope: !85)
!93 = !DILocalVariable(name: "argv", arg: 2, scope: !85, file: !12, line: 106, type: !88)
!94 = !DILocation(line: 106, column: 27, scope: !85)
!95 = !DILocation(line: 109, column: 22, scope: !85)
!96 = !DILocation(line: 109, column: 12, scope: !85)
!97 = !DILocation(line: 109, column: 5, scope: !85)
!98 = !DILocation(line: 111, column: 5, scope: !85)
!99 = !DILocation(line: 112, column: 5, scope: !85)
!100 = !DILocation(line: 113, column: 5, scope: !85)
!101 = !DILocation(line: 116, column: 5, scope: !85)
!102 = !DILocation(line: 117, column: 5, scope: !85)
!103 = !DILocation(line: 118, column: 5, scope: !85)
!104 = !DILocation(line: 120, column: 5, scope: !85)
!105 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 63, type: !13, scopeLine: 64, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!106 = !DILocalVariable(name: "data", scope: !105, file: !12, line: 65, type: !16)
!107 = !DILocation(line: 65, column: 15, scope: !105)
!108 = !DILocalVariable(name: "myUnion", scope: !105, file: !12, line: 66, type: !22)
!109 = !DILocation(line: 66, column: 64, scope: !105)
!110 = !DILocalVariable(name: "dataBuffer", scope: !105, file: !12, line: 67, type: !29)
!111 = !DILocation(line: 67, column: 13, scope: !105)
!112 = !DILocation(line: 68, column: 13, scope: !105)
!113 = !DILocation(line: 68, column: 5, scope: !105)
!114 = !DILocation(line: 69, column: 5, scope: !105)
!115 = !DILocation(line: 69, column: 23, scope: !105)
!116 = !DILocation(line: 71, column: 12, scope: !105)
!117 = !DILocation(line: 71, column: 10, scope: !105)
!118 = !DILocation(line: 72, column: 26, scope: !105)
!119 = !DILocation(line: 72, column: 13, scope: !105)
!120 = !DILocation(line: 72, column: 24, scope: !105)
!121 = !DILocalVariable(name: "data", scope: !122, file: !12, line: 74, type: !16)
!122 = distinct !DILexicalBlock(scope: !105, file: !12, line: 73, column: 5)
!123 = !DILocation(line: 74, column: 19, scope: !122)
!124 = !DILocation(line: 74, column: 34, scope: !122)
!125 = !DILocalVariable(name: "i", scope: !126, file: !12, line: 76, type: !49)
!126 = distinct !DILexicalBlock(scope: !122, file: !12, line: 75, column: 9)
!127 = !DILocation(line: 76, column: 20, scope: !126)
!128 = !DILocalVariable(name: "dest", scope: !126, file: !12, line: 77, type: !29)
!129 = !DILocation(line: 77, column: 21, scope: !126)
!130 = !DILocation(line: 78, column: 21, scope: !126)
!131 = !DILocation(line: 78, column: 13, scope: !126)
!132 = !DILocation(line: 79, column: 13, scope: !126)
!133 = !DILocation(line: 79, column: 25, scope: !126)
!134 = !DILocation(line: 81, column: 20, scope: !135)
!135 = distinct !DILexicalBlock(scope: !126, file: !12, line: 81, column: 13)
!136 = !DILocation(line: 81, column: 18, scope: !135)
!137 = !DILocation(line: 81, column: 25, scope: !138)
!138 = distinct !DILexicalBlock(scope: !135, file: !12, line: 81, column: 13)
!139 = !DILocation(line: 81, column: 27, scope: !138)
!140 = !DILocation(line: 81, column: 13, scope: !135)
!141 = !DILocation(line: 83, column: 27, scope: !142)
!142 = distinct !DILexicalBlock(scope: !138, file: !12, line: 82, column: 13)
!143 = !DILocation(line: 83, column: 32, scope: !142)
!144 = !DILocation(line: 83, column: 22, scope: !142)
!145 = !DILocation(line: 83, column: 17, scope: !142)
!146 = !DILocation(line: 83, column: 25, scope: !142)
!147 = !DILocation(line: 84, column: 13, scope: !142)
!148 = !DILocation(line: 81, column: 35, scope: !138)
!149 = !DILocation(line: 81, column: 13, scope: !138)
!150 = distinct !{!150, !140, !151, !76}
!151 = !DILocation(line: 84, column: 13, scope: !135)
!152 = !DILocation(line: 86, column: 13, scope: !126)
!153 = !DILocation(line: 86, column: 25, scope: !126)
!154 = !DILocation(line: 87, column: 24, scope: !126)
!155 = !DILocation(line: 87, column: 13, scope: !126)
!156 = !DILocation(line: 90, column: 1, scope: !105)
