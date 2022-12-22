; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_12.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_12.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_12_bad() #0 !dbg !11 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca [50 x i64], align 16
  %dataGoodBuffer = alloca [100 x i64], align 16
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !15, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata [50 x i64]* %dataBadBuffer, metadata !23, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.declare(metadata [100 x i64]* %dataGoodBuffer, metadata !28, metadata !DIExpression()), !dbg !32
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !33
  %tobool = icmp ne i32 %call, 0, !dbg !33
  br i1 %tobool, label %if.then, label %if.else, !dbg !35

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [50 x i64], [50 x i64]* %dataBadBuffer, i64 0, i64 0, !dbg !36
  store i64* %arraydecay, i64** %data, align 8, !dbg !38
  br label %if.end, !dbg !39

if.else:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [100 x i64], [100 x i64]* %dataGoodBuffer, i64 0, i64 0, !dbg !40
  store i64* %arraydecay1, i64** %data, align 8, !dbg !42
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !43, metadata !DIExpression()), !dbg !45
  %0 = bitcast [100 x i64]* %source to i8*, !dbg !45
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 800, i1 false), !dbg !45
  call void @llvm.dbg.declare(metadata i64* %i, metadata !46, metadata !DIExpression()), !dbg !51
  store i64 0, i64* %i, align 8, !dbg !52
  br label %for.cond, !dbg !54

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i64, i64* %i, align 8, !dbg !55
  %cmp = icmp ult i64 %1, 100, !dbg !57
  br i1 %cmp, label %for.body, label %for.end, !dbg !58

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !59
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %2, !dbg !61
  %3 = load i64, i64* %arrayidx, align 8, !dbg !61
  %4 = load i64*, i64** %data, align 8, !dbg !62
  %5 = load i64, i64* %i, align 8, !dbg !63
  %arrayidx2 = getelementptr inbounds i64, i64* %4, i64 %5, !dbg !62
  store i64 %3, i64* %arrayidx2, align 8, !dbg !64
  br label %for.inc, !dbg !65

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !66
  %inc = add i64 %6, 1, !dbg !66
  store i64 %inc, i64* %i, align 8, !dbg !66
  br label %for.cond, !dbg !67, !llvm.loop !68

for.end:                                          ; preds = %for.cond
  %7 = load i64*, i64** %data, align 8, !dbg !71
  %arrayidx3 = getelementptr inbounds i64, i64* %7, i64 0, !dbg !71
  %8 = load i64, i64* %arrayidx3, align 8, !dbg !71
  call void @printLongLongLine(i64 %8), !dbg !72
  ret void, !dbg !73
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @globalReturnsTrueOrFalse(...) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

declare dso_local void @printLongLongLine(i64) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_12_good() #0 !dbg !74 {
entry:
  call void @goodG2B(), !dbg !75
  ret void, !dbg !76
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !77 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !84, metadata !DIExpression()), !dbg !85
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !86, metadata !DIExpression()), !dbg !87
  %call = call i64 @time(i64* null) #5, !dbg !88
  %conv = trunc i64 %call to i32, !dbg !89
  call void @srand(i32 %conv) #5, !dbg !90
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !91
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_12_good(), !dbg !92
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !93
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !94
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_12_bad(), !dbg !95
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !96
  ret i32 0, !dbg !97
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !98 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca [50 x i64], align 16
  %dataGoodBuffer = alloca [100 x i64], align 16
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !99, metadata !DIExpression()), !dbg !100
  call void @llvm.dbg.declare(metadata [50 x i64]* %dataBadBuffer, metadata !101, metadata !DIExpression()), !dbg !102
  call void @llvm.dbg.declare(metadata [100 x i64]* %dataGoodBuffer, metadata !103, metadata !DIExpression()), !dbg !104
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !105
  %tobool = icmp ne i32 %call, 0, !dbg !105
  br i1 %tobool, label %if.then, label %if.else, !dbg !107

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %dataGoodBuffer, i64 0, i64 0, !dbg !108
  store i64* %arraydecay, i64** %data, align 8, !dbg !110
  br label %if.end, !dbg !111

if.else:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [100 x i64], [100 x i64]* %dataGoodBuffer, i64 0, i64 0, !dbg !112
  store i64* %arraydecay1, i64** %data, align 8, !dbg !114
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !115, metadata !DIExpression()), !dbg !117
  %0 = bitcast [100 x i64]* %source to i8*, !dbg !117
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 800, i1 false), !dbg !117
  call void @llvm.dbg.declare(metadata i64* %i, metadata !118, metadata !DIExpression()), !dbg !120
  store i64 0, i64* %i, align 8, !dbg !121
  br label %for.cond, !dbg !123

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i64, i64* %i, align 8, !dbg !124
  %cmp = icmp ult i64 %1, 100, !dbg !126
  br i1 %cmp, label %for.body, label %for.end, !dbg !127

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !128
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %2, !dbg !130
  %3 = load i64, i64* %arrayidx, align 8, !dbg !130
  %4 = load i64*, i64** %data, align 8, !dbg !131
  %5 = load i64, i64* %i, align 8, !dbg !132
  %arrayidx2 = getelementptr inbounds i64, i64* %4, i64 %5, !dbg !131
  store i64 %3, i64* %arrayidx2, align 8, !dbg !133
  br label %for.inc, !dbg !134

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !135
  %inc = add i64 %6, 1, !dbg !135
  store i64 %inc, i64* %i, align 8, !dbg !135
  br label %for.cond, !dbg !136, !llvm.loop !137

for.end:                                          ; preds = %for.cond
  %7 = load i64*, i64** %data, align 8, !dbg !139
  %arrayidx3 = getelementptr inbounds i64, i64* %7, i64 0, !dbg !139
  %8 = load i64, i64* %arrayidx3, align 8, !dbg !139
  call void @printLongLongLine(i64 %8), !dbg !140
  ret void, !dbg !141
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_12.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_12_bad", scope: !12, file: !12, line: 21, type: !13, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_12.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 23, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !18, line: 27, baseType: !19)
!18 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!19 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !20, line: 43, baseType: !21)
!20 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!21 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!22 = !DILocation(line: 23, column: 15, scope: !11)
!23 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 24, type: !24)
!24 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !25)
!25 = !{!26}
!26 = !DISubrange(count: 50)
!27 = !DILocation(line: 24, column: 13, scope: !11)
!28 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 25, type: !29)
!29 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 6400, elements: !30)
!30 = !{!31}
!31 = !DISubrange(count: 100)
!32 = !DILocation(line: 25, column: 13, scope: !11)
!33 = !DILocation(line: 26, column: 8, scope: !34)
!34 = distinct !DILexicalBlock(scope: !11, file: !12, line: 26, column: 8)
!35 = !DILocation(line: 26, column: 8, scope: !11)
!36 = !DILocation(line: 30, column: 16, scope: !37)
!37 = distinct !DILexicalBlock(scope: !34, file: !12, line: 27, column: 5)
!38 = !DILocation(line: 30, column: 14, scope: !37)
!39 = !DILocation(line: 31, column: 5, scope: !37)
!40 = !DILocation(line: 35, column: 16, scope: !41)
!41 = distinct !DILexicalBlock(scope: !34, file: !12, line: 33, column: 5)
!42 = !DILocation(line: 35, column: 14, scope: !41)
!43 = !DILocalVariable(name: "source", scope: !44, file: !12, line: 38, type: !29)
!44 = distinct !DILexicalBlock(scope: !11, file: !12, line: 37, column: 5)
!45 = !DILocation(line: 38, column: 17, scope: !44)
!46 = !DILocalVariable(name: "i", scope: !47, file: !12, line: 40, type: !48)
!47 = distinct !DILexicalBlock(scope: !44, file: !12, line: 39, column: 9)
!48 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !49, line: 46, baseType: !50)
!49 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!50 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!51 = !DILocation(line: 40, column: 20, scope: !47)
!52 = !DILocation(line: 42, column: 20, scope: !53)
!53 = distinct !DILexicalBlock(scope: !47, file: !12, line: 42, column: 13)
!54 = !DILocation(line: 42, column: 18, scope: !53)
!55 = !DILocation(line: 42, column: 25, scope: !56)
!56 = distinct !DILexicalBlock(scope: !53, file: !12, line: 42, column: 13)
!57 = !DILocation(line: 42, column: 27, scope: !56)
!58 = !DILocation(line: 42, column: 13, scope: !53)
!59 = !DILocation(line: 44, column: 34, scope: !60)
!60 = distinct !DILexicalBlock(scope: !56, file: !12, line: 43, column: 13)
!61 = !DILocation(line: 44, column: 27, scope: !60)
!62 = !DILocation(line: 44, column: 17, scope: !60)
!63 = !DILocation(line: 44, column: 22, scope: !60)
!64 = !DILocation(line: 44, column: 25, scope: !60)
!65 = !DILocation(line: 45, column: 13, scope: !60)
!66 = !DILocation(line: 42, column: 35, scope: !56)
!67 = !DILocation(line: 42, column: 13, scope: !56)
!68 = distinct !{!68, !58, !69, !70}
!69 = !DILocation(line: 45, column: 13, scope: !53)
!70 = !{!"llvm.loop.mustprogress"}
!71 = !DILocation(line: 46, column: 31, scope: !47)
!72 = !DILocation(line: 46, column: 13, scope: !47)
!73 = !DILocation(line: 49, column: 1, scope: !11)
!74 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_12_good", scope: !12, file: !12, line: 86, type: !13, scopeLine: 87, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!75 = !DILocation(line: 88, column: 5, scope: !74)
!76 = !DILocation(line: 89, column: 1, scope: !74)
!77 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 101, type: !78, scopeLine: 102, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!78 = !DISubroutineType(types: !79)
!79 = !{!80, !80, !81}
!80 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!81 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !82, size: 64)
!82 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !83, size: 64)
!83 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!84 = !DILocalVariable(name: "argc", arg: 1, scope: !77, file: !12, line: 101, type: !80)
!85 = !DILocation(line: 101, column: 14, scope: !77)
!86 = !DILocalVariable(name: "argv", arg: 2, scope: !77, file: !12, line: 101, type: !81)
!87 = !DILocation(line: 101, column: 27, scope: !77)
!88 = !DILocation(line: 104, column: 22, scope: !77)
!89 = !DILocation(line: 104, column: 12, scope: !77)
!90 = !DILocation(line: 104, column: 5, scope: !77)
!91 = !DILocation(line: 106, column: 5, scope: !77)
!92 = !DILocation(line: 107, column: 5, scope: !77)
!93 = !DILocation(line: 108, column: 5, scope: !77)
!94 = !DILocation(line: 111, column: 5, scope: !77)
!95 = !DILocation(line: 112, column: 5, scope: !77)
!96 = !DILocation(line: 113, column: 5, scope: !77)
!97 = !DILocation(line: 115, column: 5, scope: !77)
!98 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 57, type: !13, scopeLine: 58, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!99 = !DILocalVariable(name: "data", scope: !98, file: !12, line: 59, type: !16)
!100 = !DILocation(line: 59, column: 15, scope: !98)
!101 = !DILocalVariable(name: "dataBadBuffer", scope: !98, file: !12, line: 60, type: !24)
!102 = !DILocation(line: 60, column: 13, scope: !98)
!103 = !DILocalVariable(name: "dataGoodBuffer", scope: !98, file: !12, line: 61, type: !29)
!104 = !DILocation(line: 61, column: 13, scope: !98)
!105 = !DILocation(line: 62, column: 8, scope: !106)
!106 = distinct !DILexicalBlock(scope: !98, file: !12, line: 62, column: 8)
!107 = !DILocation(line: 62, column: 8, scope: !98)
!108 = !DILocation(line: 65, column: 16, scope: !109)
!109 = distinct !DILexicalBlock(scope: !106, file: !12, line: 63, column: 5)
!110 = !DILocation(line: 65, column: 14, scope: !109)
!111 = !DILocation(line: 66, column: 5, scope: !109)
!112 = !DILocation(line: 70, column: 16, scope: !113)
!113 = distinct !DILexicalBlock(scope: !106, file: !12, line: 68, column: 5)
!114 = !DILocation(line: 70, column: 14, scope: !113)
!115 = !DILocalVariable(name: "source", scope: !116, file: !12, line: 73, type: !29)
!116 = distinct !DILexicalBlock(scope: !98, file: !12, line: 72, column: 5)
!117 = !DILocation(line: 73, column: 17, scope: !116)
!118 = !DILocalVariable(name: "i", scope: !119, file: !12, line: 75, type: !48)
!119 = distinct !DILexicalBlock(scope: !116, file: !12, line: 74, column: 9)
!120 = !DILocation(line: 75, column: 20, scope: !119)
!121 = !DILocation(line: 77, column: 20, scope: !122)
!122 = distinct !DILexicalBlock(scope: !119, file: !12, line: 77, column: 13)
!123 = !DILocation(line: 77, column: 18, scope: !122)
!124 = !DILocation(line: 77, column: 25, scope: !125)
!125 = distinct !DILexicalBlock(scope: !122, file: !12, line: 77, column: 13)
!126 = !DILocation(line: 77, column: 27, scope: !125)
!127 = !DILocation(line: 77, column: 13, scope: !122)
!128 = !DILocation(line: 79, column: 34, scope: !129)
!129 = distinct !DILexicalBlock(scope: !125, file: !12, line: 78, column: 13)
!130 = !DILocation(line: 79, column: 27, scope: !129)
!131 = !DILocation(line: 79, column: 17, scope: !129)
!132 = !DILocation(line: 79, column: 22, scope: !129)
!133 = !DILocation(line: 79, column: 25, scope: !129)
!134 = !DILocation(line: 80, column: 13, scope: !129)
!135 = !DILocation(line: 77, column: 35, scope: !125)
!136 = !DILocation(line: 77, column: 13, scope: !125)
!137 = distinct !{!137, !127, !138, !70}
!138 = !DILocation(line: 80, column: 13, scope: !122)
!139 = !DILocation(line: 81, column: 31, scope: !119)
!140 = !DILocation(line: 81, column: 13, scope: !119)
!141 = !DILocation(line: 84, column: 1, scope: !98)
