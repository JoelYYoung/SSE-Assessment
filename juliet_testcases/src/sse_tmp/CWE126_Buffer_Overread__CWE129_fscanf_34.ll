; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__CWE129_fscanf_34.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_fscanf_34.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque
%union.CWE126_Buffer_Overread__CWE129_fscanf_34_unionType = type { i32 }

@stdin = external dso_local global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.1 = private unnamed_addr constant [31 x i8] c"ERROR: Array index is negative\00", align 1
@.str.2 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.3 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.4 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.5 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE129_fscanf_34_bad() #0 !dbg !11 {
entry:
  %data = alloca i32, align 4
  %myUnion = alloca %union.CWE126_Buffer_Overread__CWE129_fscanf_34_unionType, align 4
  %data1 = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !15, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.declare(metadata %union.CWE126_Buffer_Overread__CWE129_fscanf_34_unionType* %myUnion, metadata !18, metadata !DIExpression()), !dbg !24
  store i32 -1, i32* %data, align 4, !dbg !25
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !26
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* %data), !dbg !27
  %1 = load i32, i32* %data, align 4, !dbg !28
  %unionFirst = bitcast %union.CWE126_Buffer_Overread__CWE129_fscanf_34_unionType* %myUnion to i32*, !dbg !29
  store i32 %1, i32* %unionFirst, align 4, !dbg !30
  call void @llvm.dbg.declare(metadata i32* %data1, metadata !31, metadata !DIExpression()), !dbg !33
  %unionSecond = bitcast %union.CWE126_Buffer_Overread__CWE129_fscanf_34_unionType* %myUnion to i32*, !dbg !34
  %2 = load i32, i32* %unionSecond, align 4, !dbg !34
  store i32 %2, i32* %data1, align 4, !dbg !33
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !35, metadata !DIExpression()), !dbg !40
  %3 = bitcast [10 x i32]* %buffer to i8*, !dbg !40
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 40, i1 false), !dbg !40
  %4 = load i32, i32* %data1, align 4, !dbg !41
  %cmp = icmp sge i32 %4, 0, !dbg !43
  br i1 %cmp, label %if.then, label %if.else, !dbg !44

if.then:                                          ; preds = %entry
  %5 = load i32, i32* %data1, align 4, !dbg !45
  %idxprom = sext i32 %5 to i64, !dbg !47
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !47
  %6 = load i32, i32* %arrayidx, align 4, !dbg !47
  call void @printIntLine(i32 %6), !dbg !48
  br label %if.end, !dbg !49

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0)), !dbg !50
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !52
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @__isoc99_fscanf(%struct._IO_FILE*, i8*, ...) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

declare dso_local void @printIntLine(i32) #2

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE129_fscanf_34_good() #0 !dbg !53 {
entry:
  call void @goodG2B(), !dbg !54
  call void @goodB2G(), !dbg !55
  ret void, !dbg !56
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !57 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !63, metadata !DIExpression()), !dbg !64
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !65, metadata !DIExpression()), !dbg !66
  %call = call i64 @time(i64* null) #5, !dbg !67
  %conv = trunc i64 %call to i32, !dbg !68
  call void @srand(i32 %conv) #5, !dbg !69
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0)), !dbg !70
  call void @CWE126_Buffer_Overread__CWE129_fscanf_34_good(), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !73
  call void @CWE126_Buffer_Overread__CWE129_fscanf_34_bad(), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !75
  ret i32 0, !dbg !76
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !77 {
entry:
  %data = alloca i32, align 4
  %myUnion = alloca %union.CWE126_Buffer_Overread__CWE129_fscanf_34_unionType, align 4
  %data1 = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !78, metadata !DIExpression()), !dbg !79
  call void @llvm.dbg.declare(metadata %union.CWE126_Buffer_Overread__CWE129_fscanf_34_unionType* %myUnion, metadata !80, metadata !DIExpression()), !dbg !81
  store i32 -1, i32* %data, align 4, !dbg !82
  store i32 7, i32* %data, align 4, !dbg !83
  %0 = load i32, i32* %data, align 4, !dbg !84
  %unionFirst = bitcast %union.CWE126_Buffer_Overread__CWE129_fscanf_34_unionType* %myUnion to i32*, !dbg !85
  store i32 %0, i32* %unionFirst, align 4, !dbg !86
  call void @llvm.dbg.declare(metadata i32* %data1, metadata !87, metadata !DIExpression()), !dbg !89
  %unionSecond = bitcast %union.CWE126_Buffer_Overread__CWE129_fscanf_34_unionType* %myUnion to i32*, !dbg !90
  %1 = load i32, i32* %unionSecond, align 4, !dbg !90
  store i32 %1, i32* %data1, align 4, !dbg !89
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !91, metadata !DIExpression()), !dbg !93
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !93
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !93
  %3 = load i32, i32* %data1, align 4, !dbg !94
  %cmp = icmp sge i32 %3, 0, !dbg !96
  br i1 %cmp, label %if.then, label %if.else, !dbg !97

if.then:                                          ; preds = %entry
  %4 = load i32, i32* %data1, align 4, !dbg !98
  %idxprom = sext i32 %4 to i64, !dbg !100
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !100
  %5 = load i32, i32* %arrayidx, align 4, !dbg !100
  call void @printIntLine(i32 %5), !dbg !101
  br label %if.end, !dbg !102

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0)), !dbg !103
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !105
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G() #0 !dbg !106 {
entry:
  %data = alloca i32, align 4
  %myUnion = alloca %union.CWE126_Buffer_Overread__CWE129_fscanf_34_unionType, align 4
  %data1 = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !107, metadata !DIExpression()), !dbg !108
  call void @llvm.dbg.declare(metadata %union.CWE126_Buffer_Overread__CWE129_fscanf_34_unionType* %myUnion, metadata !109, metadata !DIExpression()), !dbg !110
  store i32 -1, i32* %data, align 4, !dbg !111
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !112
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* %data), !dbg !113
  %1 = load i32, i32* %data, align 4, !dbg !114
  %unionFirst = bitcast %union.CWE126_Buffer_Overread__CWE129_fscanf_34_unionType* %myUnion to i32*, !dbg !115
  store i32 %1, i32* %unionFirst, align 4, !dbg !116
  call void @llvm.dbg.declare(metadata i32* %data1, metadata !117, metadata !DIExpression()), !dbg !119
  %unionSecond = bitcast %union.CWE126_Buffer_Overread__CWE129_fscanf_34_unionType* %myUnion to i32*, !dbg !120
  %2 = load i32, i32* %unionSecond, align 4, !dbg !120
  store i32 %2, i32* %data1, align 4, !dbg !119
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !121, metadata !DIExpression()), !dbg !123
  %3 = bitcast [10 x i32]* %buffer to i8*, !dbg !123
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 40, i1 false), !dbg !123
  %4 = load i32, i32* %data1, align 4, !dbg !124
  %cmp = icmp sge i32 %4, 0, !dbg !126
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !127

land.lhs.true:                                    ; preds = %entry
  %5 = load i32, i32* %data1, align 4, !dbg !128
  %cmp2 = icmp slt i32 %5, 10, !dbg !129
  br i1 %cmp2, label %if.then, label %if.else, !dbg !130

if.then:                                          ; preds = %land.lhs.true
  %6 = load i32, i32* %data1, align 4, !dbg !131
  %idxprom = sext i32 %6 to i64, !dbg !133
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !133
  %7 = load i32, i32* %arrayidx, align 4, !dbg !133
  call void @printIntLine(i32 %7), !dbg !134
  br label %if.end, !dbg !135

if.else:                                          ; preds = %land.lhs.true, %entry
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !136
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !138
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__CWE129_fscanf_34.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_fscanf_34_bad", scope: !12, file: !12, line: 28, type: !13, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_fscanf_34.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 30, type: !16)
!16 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!17 = !DILocation(line: 30, column: 9, scope: !11)
!18 = !DILocalVariable(name: "myUnion", scope: !11, file: !12, line: 31, type: !19)
!19 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE126_Buffer_Overread__CWE129_fscanf_34_unionType", file: !12, line: 24, baseType: !20)
!20 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !12, line: 20, size: 32, elements: !21)
!21 = !{!22, !23}
!22 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !20, file: !12, line: 22, baseType: !16, size: 32)
!23 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !20, file: !12, line: 23, baseType: !16, size: 32)
!24 = !DILocation(line: 31, column: 56, scope: !11)
!25 = !DILocation(line: 33, column: 10, scope: !11)
!26 = !DILocation(line: 35, column: 12, scope: !11)
!27 = !DILocation(line: 35, column: 5, scope: !11)
!28 = !DILocation(line: 36, column: 26, scope: !11)
!29 = !DILocation(line: 36, column: 13, scope: !11)
!30 = !DILocation(line: 36, column: 24, scope: !11)
!31 = !DILocalVariable(name: "data", scope: !32, file: !12, line: 38, type: !16)
!32 = distinct !DILexicalBlock(scope: !11, file: !12, line: 37, column: 5)
!33 = !DILocation(line: 38, column: 13, scope: !32)
!34 = !DILocation(line: 38, column: 28, scope: !32)
!35 = !DILocalVariable(name: "buffer", scope: !36, file: !12, line: 40, type: !37)
!36 = distinct !DILexicalBlock(scope: !32, file: !12, line: 39, column: 9)
!37 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 320, elements: !38)
!38 = !{!39}
!39 = !DISubrange(count: 10)
!40 = !DILocation(line: 40, column: 17, scope: !36)
!41 = !DILocation(line: 43, column: 17, scope: !42)
!42 = distinct !DILexicalBlock(scope: !36, file: !12, line: 43, column: 17)
!43 = !DILocation(line: 43, column: 22, scope: !42)
!44 = !DILocation(line: 43, column: 17, scope: !36)
!45 = !DILocation(line: 45, column: 37, scope: !46)
!46 = distinct !DILexicalBlock(scope: !42, file: !12, line: 44, column: 13)
!47 = !DILocation(line: 45, column: 30, scope: !46)
!48 = !DILocation(line: 45, column: 17, scope: !46)
!49 = !DILocation(line: 46, column: 13, scope: !46)
!50 = !DILocation(line: 49, column: 17, scope: !51)
!51 = distinct !DILexicalBlock(scope: !42, file: !12, line: 48, column: 13)
!52 = !DILocation(line: 53, column: 1, scope: !11)
!53 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_fscanf_34_good", scope: !12, file: !12, line: 115, type: !13, scopeLine: 116, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!54 = !DILocation(line: 117, column: 5, scope: !53)
!55 = !DILocation(line: 118, column: 5, scope: !53)
!56 = !DILocation(line: 119, column: 1, scope: !53)
!57 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 129, type: !58, scopeLine: 130, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!58 = !DISubroutineType(types: !59)
!59 = !{!16, !16, !60}
!60 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !62, size: 64)
!62 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!63 = !DILocalVariable(name: "argc", arg: 1, scope: !57, file: !12, line: 129, type: !16)
!64 = !DILocation(line: 129, column: 14, scope: !57)
!65 = !DILocalVariable(name: "argv", arg: 2, scope: !57, file: !12, line: 129, type: !60)
!66 = !DILocation(line: 129, column: 27, scope: !57)
!67 = !DILocation(line: 132, column: 22, scope: !57)
!68 = !DILocation(line: 132, column: 12, scope: !57)
!69 = !DILocation(line: 132, column: 5, scope: !57)
!70 = !DILocation(line: 134, column: 5, scope: !57)
!71 = !DILocation(line: 135, column: 5, scope: !57)
!72 = !DILocation(line: 136, column: 5, scope: !57)
!73 = !DILocation(line: 139, column: 5, scope: !57)
!74 = !DILocation(line: 140, column: 5, scope: !57)
!75 = !DILocation(line: 141, column: 5, scope: !57)
!76 = !DILocation(line: 143, column: 5, scope: !57)
!77 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 60, type: !13, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!78 = !DILocalVariable(name: "data", scope: !77, file: !12, line: 62, type: !16)
!79 = !DILocation(line: 62, column: 9, scope: !77)
!80 = !DILocalVariable(name: "myUnion", scope: !77, file: !12, line: 63, type: !19)
!81 = !DILocation(line: 63, column: 56, scope: !77)
!82 = !DILocation(line: 65, column: 10, scope: !77)
!83 = !DILocation(line: 68, column: 10, scope: !77)
!84 = !DILocation(line: 69, column: 26, scope: !77)
!85 = !DILocation(line: 69, column: 13, scope: !77)
!86 = !DILocation(line: 69, column: 24, scope: !77)
!87 = !DILocalVariable(name: "data", scope: !88, file: !12, line: 71, type: !16)
!88 = distinct !DILexicalBlock(scope: !77, file: !12, line: 70, column: 5)
!89 = !DILocation(line: 71, column: 13, scope: !88)
!90 = !DILocation(line: 71, column: 28, scope: !88)
!91 = !DILocalVariable(name: "buffer", scope: !92, file: !12, line: 73, type: !37)
!92 = distinct !DILexicalBlock(scope: !88, file: !12, line: 72, column: 9)
!93 = !DILocation(line: 73, column: 17, scope: !92)
!94 = !DILocation(line: 76, column: 17, scope: !95)
!95 = distinct !DILexicalBlock(scope: !92, file: !12, line: 76, column: 17)
!96 = !DILocation(line: 76, column: 22, scope: !95)
!97 = !DILocation(line: 76, column: 17, scope: !92)
!98 = !DILocation(line: 78, column: 37, scope: !99)
!99 = distinct !DILexicalBlock(scope: !95, file: !12, line: 77, column: 13)
!100 = !DILocation(line: 78, column: 30, scope: !99)
!101 = !DILocation(line: 78, column: 17, scope: !99)
!102 = !DILocation(line: 79, column: 13, scope: !99)
!103 = !DILocation(line: 82, column: 17, scope: !104)
!104 = distinct !DILexicalBlock(scope: !95, file: !12, line: 81, column: 13)
!105 = !DILocation(line: 86, column: 1, scope: !77)
!106 = distinct !DISubprogram(name: "goodB2G", scope: !12, file: !12, line: 89, type: !13, scopeLine: 90, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!107 = !DILocalVariable(name: "data", scope: !106, file: !12, line: 91, type: !16)
!108 = !DILocation(line: 91, column: 9, scope: !106)
!109 = !DILocalVariable(name: "myUnion", scope: !106, file: !12, line: 92, type: !19)
!110 = !DILocation(line: 92, column: 56, scope: !106)
!111 = !DILocation(line: 94, column: 10, scope: !106)
!112 = !DILocation(line: 96, column: 12, scope: !106)
!113 = !DILocation(line: 96, column: 5, scope: !106)
!114 = !DILocation(line: 97, column: 26, scope: !106)
!115 = !DILocation(line: 97, column: 13, scope: !106)
!116 = !DILocation(line: 97, column: 24, scope: !106)
!117 = !DILocalVariable(name: "data", scope: !118, file: !12, line: 99, type: !16)
!118 = distinct !DILexicalBlock(scope: !106, file: !12, line: 98, column: 5)
!119 = !DILocation(line: 99, column: 13, scope: !118)
!120 = !DILocation(line: 99, column: 28, scope: !118)
!121 = !DILocalVariable(name: "buffer", scope: !122, file: !12, line: 101, type: !37)
!122 = distinct !DILexicalBlock(scope: !118, file: !12, line: 100, column: 9)
!123 = !DILocation(line: 101, column: 17, scope: !122)
!124 = !DILocation(line: 103, column: 17, scope: !125)
!125 = distinct !DILexicalBlock(scope: !122, file: !12, line: 103, column: 17)
!126 = !DILocation(line: 103, column: 22, scope: !125)
!127 = !DILocation(line: 103, column: 27, scope: !125)
!128 = !DILocation(line: 103, column: 30, scope: !125)
!129 = !DILocation(line: 103, column: 35, scope: !125)
!130 = !DILocation(line: 103, column: 17, scope: !122)
!131 = !DILocation(line: 105, column: 37, scope: !132)
!132 = distinct !DILexicalBlock(scope: !125, file: !12, line: 104, column: 13)
!133 = !DILocation(line: 105, column: 30, scope: !132)
!134 = !DILocation(line: 105, column: 17, scope: !132)
!135 = !DILocation(line: 106, column: 13, scope: !132)
!136 = !DILocation(line: 109, column: 17, scope: !137)
!137 = distinct !DILexicalBlock(scope: !125, file: !12, line: 108, column: 13)
!138 = !DILocation(line: 113, column: 1, scope: !106)
