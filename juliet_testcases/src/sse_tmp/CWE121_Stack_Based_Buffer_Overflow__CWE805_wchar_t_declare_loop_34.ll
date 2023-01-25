; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_34.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_34.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_34_unionType = type { i32* }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_34_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %myUnion = alloca %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_34_unionType, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %data1 = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_34_unionType* %myUnion, metadata !21, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !28, metadata !DIExpression()), !dbg !32
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !33, metadata !DIExpression()), !dbg !37
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !38
  store i32* %arraydecay, i32** %data, align 8, !dbg !39
  %0 = load i32*, i32** %data, align 8, !dbg !40
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !40
  store i32 0, i32* %arrayidx, align 4, !dbg !41
  %1 = load i32*, i32** %data, align 8, !dbg !42
  %unionFirst = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_34_unionType* %myUnion to i32**, !dbg !43
  store i32* %1, i32** %unionFirst, align 8, !dbg !44
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !45, metadata !DIExpression()), !dbg !47
  %unionSecond = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_34_unionType* %myUnion to i32**, !dbg !48
  %2 = load i32*, i32** %unionSecond, align 8, !dbg !48
  store i32* %2, i32** %data1, align 8, !dbg !47
  call void @llvm.dbg.declare(metadata i64* %i, metadata !49, metadata !DIExpression()), !dbg !53
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !54, metadata !DIExpression()), !dbg !55
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !56
  %call = call i32* @wmemset(i32* %arraydecay2, i32 67, i64 99) #4, !dbg !57
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !58
  store i32 0, i32* %arrayidx3, align 4, !dbg !59
  store i64 0, i64* %i, align 8, !dbg !60
  br label %for.cond, !dbg !62

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i64, i64* %i, align 8, !dbg !63
  %cmp = icmp ult i64 %3, 100, !dbg !65
  br i1 %cmp, label %for.body, label %for.end, !dbg !66

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !67
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %4, !dbg !69
  %5 = load i32, i32* %arrayidx4, align 4, !dbg !69
  %6 = load i32*, i32** %data1, align 8, !dbg !70
  %7 = load i64, i64* %i, align 8, !dbg !71
  %arrayidx5 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !70
  store i32 %5, i32* %arrayidx5, align 4, !dbg !72
  br label %for.inc, !dbg !73

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !74
  %inc = add i64 %8, 1, !dbg !74
  store i64 %inc, i64* %i, align 8, !dbg !74
  br label %for.cond, !dbg !75, !llvm.loop !76

for.end:                                          ; preds = %for.cond
  %9 = load i32*, i32** %data1, align 8, !dbg !79
  %arrayidx6 = getelementptr inbounds i32, i32* %9, i64 99, !dbg !79
  store i32 0, i32* %arrayidx6, align 4, !dbg !80
  %10 = load i32*, i32** %data1, align 8, !dbg !81
  call void @printWLine(i32* %10), !dbg !82
  ret void, !dbg !83
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_34_good() #0 !dbg !84 {
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
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_34_good(), !dbg !101
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !102
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !103
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_34_bad(), !dbg !104
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
  %myUnion = alloca %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_34_unionType, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %data1 = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !108, metadata !DIExpression()), !dbg !109
  call void @llvm.dbg.declare(metadata %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_34_unionType* %myUnion, metadata !110, metadata !DIExpression()), !dbg !111
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !112, metadata !DIExpression()), !dbg !113
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !114, metadata !DIExpression()), !dbg !115
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !116
  store i32* %arraydecay, i32** %data, align 8, !dbg !117
  %0 = load i32*, i32** %data, align 8, !dbg !118
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !118
  store i32 0, i32* %arrayidx, align 4, !dbg !119
  %1 = load i32*, i32** %data, align 8, !dbg !120
  %unionFirst = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_34_unionType* %myUnion to i32**, !dbg !121
  store i32* %1, i32** %unionFirst, align 8, !dbg !122
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !123, metadata !DIExpression()), !dbg !125
  %unionSecond = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_34_unionType* %myUnion to i32**, !dbg !126
  %2 = load i32*, i32** %unionSecond, align 8, !dbg !126
  store i32* %2, i32** %data1, align 8, !dbg !125
  call void @llvm.dbg.declare(metadata i64* %i, metadata !127, metadata !DIExpression()), !dbg !129
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !130, metadata !DIExpression()), !dbg !131
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !132
  %call = call i32* @wmemset(i32* %arraydecay2, i32 67, i64 99) #4, !dbg !133
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !134
  store i32 0, i32* %arrayidx3, align 4, !dbg !135
  store i64 0, i64* %i, align 8, !dbg !136
  br label %for.cond, !dbg !138

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i64, i64* %i, align 8, !dbg !139
  %cmp = icmp ult i64 %3, 100, !dbg !141
  br i1 %cmp, label %for.body, label %for.end, !dbg !142

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !143
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %4, !dbg !145
  %5 = load i32, i32* %arrayidx4, align 4, !dbg !145
  %6 = load i32*, i32** %data1, align 8, !dbg !146
  %7 = load i64, i64* %i, align 8, !dbg !147
  %arrayidx5 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !146
  store i32 %5, i32* %arrayidx5, align 4, !dbg !148
  br label %for.inc, !dbg !149

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !150
  %inc = add i64 %8, 1, !dbg !150
  store i64 %inc, i64* %i, align 8, !dbg !150
  br label %for.cond, !dbg !151, !llvm.loop !152

for.end:                                          ; preds = %for.cond
  %9 = load i32*, i32** %data1, align 8, !dbg !154
  %arrayidx6 = getelementptr inbounds i32, i32* %9, i64 99, !dbg !154
  store i32 0, i32* %arrayidx6, align 4, !dbg !155
  %10 = load i32*, i32** %data1, align 8, !dbg !156
  call void @printWLine(i32* %10), !dbg !157
  ret void, !dbg !158
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_34.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_34_bad", scope: !12, file: !12, line: 29, type: !13, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_34.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 31, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !18, line: 74, baseType: !19)
!18 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 31, column: 15, scope: !11)
!21 = !DILocalVariable(name: "myUnion", scope: !11, file: !12, line: 32, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_34_unionType", file: !12, line: 25, baseType: !23)
!23 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !12, line: 21, size: 64, elements: !24)
!24 = !{!25, !26}
!25 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !23, file: !12, line: 23, baseType: !16, size: 64)
!26 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !23, file: !12, line: 24, baseType: !16, size: 64)
!27 = !DILocation(line: 32, column: 82, scope: !11)
!28 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 33, type: !29)
!29 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 1600, elements: !30)
!30 = !{!31}
!31 = !DISubrange(count: 50)
!32 = !DILocation(line: 33, column: 13, scope: !11)
!33 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 34, type: !34)
!34 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !35)
!35 = !{!36}
!36 = !DISubrange(count: 100)
!37 = !DILocation(line: 34, column: 13, scope: !11)
!38 = !DILocation(line: 37, column: 12, scope: !11)
!39 = !DILocation(line: 37, column: 10, scope: !11)
!40 = !DILocation(line: 38, column: 5, scope: !11)
!41 = !DILocation(line: 38, column: 13, scope: !11)
!42 = !DILocation(line: 39, column: 26, scope: !11)
!43 = !DILocation(line: 39, column: 13, scope: !11)
!44 = !DILocation(line: 39, column: 24, scope: !11)
!45 = !DILocalVariable(name: "data", scope: !46, file: !12, line: 41, type: !16)
!46 = distinct !DILexicalBlock(scope: !11, file: !12, line: 40, column: 5)
!47 = !DILocation(line: 41, column: 19, scope: !46)
!48 = !DILocation(line: 41, column: 34, scope: !46)
!49 = !DILocalVariable(name: "i", scope: !50, file: !12, line: 43, type: !51)
!50 = distinct !DILexicalBlock(scope: !46, file: !12, line: 42, column: 9)
!51 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !18, line: 46, baseType: !52)
!52 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!53 = !DILocation(line: 43, column: 20, scope: !50)
!54 = !DILocalVariable(name: "source", scope: !50, file: !12, line: 44, type: !34)
!55 = !DILocation(line: 44, column: 21, scope: !50)
!56 = !DILocation(line: 45, column: 21, scope: !50)
!57 = !DILocation(line: 45, column: 13, scope: !50)
!58 = !DILocation(line: 46, column: 13, scope: !50)
!59 = !DILocation(line: 46, column: 27, scope: !50)
!60 = !DILocation(line: 48, column: 20, scope: !61)
!61 = distinct !DILexicalBlock(scope: !50, file: !12, line: 48, column: 13)
!62 = !DILocation(line: 48, column: 18, scope: !61)
!63 = !DILocation(line: 48, column: 25, scope: !64)
!64 = distinct !DILexicalBlock(scope: !61, file: !12, line: 48, column: 13)
!65 = !DILocation(line: 48, column: 27, scope: !64)
!66 = !DILocation(line: 48, column: 13, scope: !61)
!67 = !DILocation(line: 50, column: 34, scope: !68)
!68 = distinct !DILexicalBlock(scope: !64, file: !12, line: 49, column: 13)
!69 = !DILocation(line: 50, column: 27, scope: !68)
!70 = !DILocation(line: 50, column: 17, scope: !68)
!71 = !DILocation(line: 50, column: 22, scope: !68)
!72 = !DILocation(line: 50, column: 25, scope: !68)
!73 = !DILocation(line: 51, column: 13, scope: !68)
!74 = !DILocation(line: 48, column: 35, scope: !64)
!75 = !DILocation(line: 48, column: 13, scope: !64)
!76 = distinct !{!76, !66, !77, !78}
!77 = !DILocation(line: 51, column: 13, scope: !61)
!78 = !{!"llvm.loop.mustprogress"}
!79 = !DILocation(line: 52, column: 13, scope: !50)
!80 = !DILocation(line: 52, column: 25, scope: !50)
!81 = !DILocation(line: 53, column: 24, scope: !50)
!82 = !DILocation(line: 53, column: 13, scope: !50)
!83 = !DILocation(line: 56, column: 1, scope: !11)
!84 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_34_good", scope: !12, file: !12, line: 91, type: !13, scopeLine: 92, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!85 = !DILocation(line: 93, column: 5, scope: !84)
!86 = !DILocation(line: 94, column: 1, scope: !84)
!87 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 105, type: !88, scopeLine: 106, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!88 = !DISubroutineType(types: !89)
!89 = !{!19, !19, !90}
!90 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !91, size: 64)
!91 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !92, size: 64)
!92 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!93 = !DILocalVariable(name: "argc", arg: 1, scope: !87, file: !12, line: 105, type: !19)
!94 = !DILocation(line: 105, column: 14, scope: !87)
!95 = !DILocalVariable(name: "argv", arg: 2, scope: !87, file: !12, line: 105, type: !90)
!96 = !DILocation(line: 105, column: 27, scope: !87)
!97 = !DILocation(line: 108, column: 22, scope: !87)
!98 = !DILocation(line: 108, column: 12, scope: !87)
!99 = !DILocation(line: 108, column: 5, scope: !87)
!100 = !DILocation(line: 110, column: 5, scope: !87)
!101 = !DILocation(line: 111, column: 5, scope: !87)
!102 = !DILocation(line: 112, column: 5, scope: !87)
!103 = !DILocation(line: 115, column: 5, scope: !87)
!104 = !DILocation(line: 116, column: 5, scope: !87)
!105 = !DILocation(line: 117, column: 5, scope: !87)
!106 = !DILocation(line: 119, column: 5, scope: !87)
!107 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 63, type: !13, scopeLine: 64, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!108 = !DILocalVariable(name: "data", scope: !107, file: !12, line: 65, type: !16)
!109 = !DILocation(line: 65, column: 15, scope: !107)
!110 = !DILocalVariable(name: "myUnion", scope: !107, file: !12, line: 66, type: !22)
!111 = !DILocation(line: 66, column: 82, scope: !107)
!112 = !DILocalVariable(name: "dataBadBuffer", scope: !107, file: !12, line: 67, type: !29)
!113 = !DILocation(line: 67, column: 13, scope: !107)
!114 = !DILocalVariable(name: "dataGoodBuffer", scope: !107, file: !12, line: 68, type: !34)
!115 = !DILocation(line: 68, column: 13, scope: !107)
!116 = !DILocation(line: 70, column: 12, scope: !107)
!117 = !DILocation(line: 70, column: 10, scope: !107)
!118 = !DILocation(line: 71, column: 5, scope: !107)
!119 = !DILocation(line: 71, column: 13, scope: !107)
!120 = !DILocation(line: 72, column: 26, scope: !107)
!121 = !DILocation(line: 72, column: 13, scope: !107)
!122 = !DILocation(line: 72, column: 24, scope: !107)
!123 = !DILocalVariable(name: "data", scope: !124, file: !12, line: 74, type: !16)
!124 = distinct !DILexicalBlock(scope: !107, file: !12, line: 73, column: 5)
!125 = !DILocation(line: 74, column: 19, scope: !124)
!126 = !DILocation(line: 74, column: 34, scope: !124)
!127 = !DILocalVariable(name: "i", scope: !128, file: !12, line: 76, type: !51)
!128 = distinct !DILexicalBlock(scope: !124, file: !12, line: 75, column: 9)
!129 = !DILocation(line: 76, column: 20, scope: !128)
!130 = !DILocalVariable(name: "source", scope: !128, file: !12, line: 77, type: !34)
!131 = !DILocation(line: 77, column: 21, scope: !128)
!132 = !DILocation(line: 78, column: 21, scope: !128)
!133 = !DILocation(line: 78, column: 13, scope: !128)
!134 = !DILocation(line: 79, column: 13, scope: !128)
!135 = !DILocation(line: 79, column: 27, scope: !128)
!136 = !DILocation(line: 81, column: 20, scope: !137)
!137 = distinct !DILexicalBlock(scope: !128, file: !12, line: 81, column: 13)
!138 = !DILocation(line: 81, column: 18, scope: !137)
!139 = !DILocation(line: 81, column: 25, scope: !140)
!140 = distinct !DILexicalBlock(scope: !137, file: !12, line: 81, column: 13)
!141 = !DILocation(line: 81, column: 27, scope: !140)
!142 = !DILocation(line: 81, column: 13, scope: !137)
!143 = !DILocation(line: 83, column: 34, scope: !144)
!144 = distinct !DILexicalBlock(scope: !140, file: !12, line: 82, column: 13)
!145 = !DILocation(line: 83, column: 27, scope: !144)
!146 = !DILocation(line: 83, column: 17, scope: !144)
!147 = !DILocation(line: 83, column: 22, scope: !144)
!148 = !DILocation(line: 83, column: 25, scope: !144)
!149 = !DILocation(line: 84, column: 13, scope: !144)
!150 = !DILocation(line: 81, column: 35, scope: !140)
!151 = !DILocation(line: 81, column: 13, scope: !140)
!152 = distinct !{!152, !142, !153, !78}
!153 = !DILocation(line: 84, column: 13, scope: !137)
!154 = !DILocation(line: 85, column: 13, scope: !128)
!155 = !DILocation(line: 85, column: 25, scope: !128)
!156 = !DILocation(line: 86, column: 24, scope: !128)
!157 = !DILocation(line: 86, column: 13, scope: !128)
!158 = !DILocation(line: 89, column: 1, scope: !107)
