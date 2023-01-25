; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_14.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_14.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@globalFive = external dso_local global i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_14_bad() #0 !dbg !11 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca [50 x i64], align 16
  %dataGoodBuffer = alloca [100 x i64], align 16
  %source = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !15, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata [50 x i64]* %dataBadBuffer, metadata !23, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.declare(metadata [100 x i64]* %dataGoodBuffer, metadata !28, metadata !DIExpression()), !dbg !32
  %0 = load i32, i32* @globalFive, align 4, !dbg !33
  %cmp = icmp eq i32 %0, 5, !dbg !35
  br i1 %cmp, label %if.then, label %if.end, !dbg !36

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [50 x i64], [50 x i64]* %dataBadBuffer, i64 0, i64 0, !dbg !37
  store i64* %arraydecay, i64** %data, align 8, !dbg !39
  br label %if.end, !dbg !40

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !41, metadata !DIExpression()), !dbg !43
  %1 = bitcast [100 x i64]* %source to i8*, !dbg !43
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 800, i1 false), !dbg !43
  %2 = load i64*, i64** %data, align 8, !dbg !44
  %3 = bitcast i64* %2 to i8*, !dbg !45
  %arraydecay1 = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !45
  %4 = bitcast i64* %arraydecay1 to i8*, !dbg !45
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %3, i8* align 16 %4, i64 800, i1 false), !dbg !45
  %5 = load i64*, i64** %data, align 8, !dbg !46
  %arrayidx = getelementptr inbounds i64, i64* %5, i64 0, !dbg !46
  %6 = load i64, i64* %arrayidx, align 8, !dbg !46
  call void @printLongLongLine(i64 %6), !dbg !47
  ret void, !dbg !48
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printLongLongLine(i64) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_14_good() #0 !dbg !49 {
entry:
  call void @goodG2B1(), !dbg !50
  call void @goodG2B2(), !dbg !51
  ret void, !dbg !52
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !53 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !60, metadata !DIExpression()), !dbg !61
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !62, metadata !DIExpression()), !dbg !63
  %call = call i64 @time(i64* null) #6, !dbg !64
  %conv = trunc i64 %call to i32, !dbg !65
  call void @srand(i32 %conv) #6, !dbg !66
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !67
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_14_good(), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !70
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_14_bad(), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !72
  ret i32 0, !dbg !73
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !74 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca [50 x i64], align 16
  %dataGoodBuffer = alloca [100 x i64], align 16
  %source = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !75, metadata !DIExpression()), !dbg !76
  call void @llvm.dbg.declare(metadata [50 x i64]* %dataBadBuffer, metadata !77, metadata !DIExpression()), !dbg !78
  call void @llvm.dbg.declare(metadata [100 x i64]* %dataGoodBuffer, metadata !79, metadata !DIExpression()), !dbg !80
  %0 = load i32, i32* @globalFive, align 4, !dbg !81
  %cmp = icmp ne i32 %0, 5, !dbg !83
  br i1 %cmp, label %if.then, label %if.else, !dbg !84

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !85
  br label %if.end, !dbg !87

if.else:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %dataGoodBuffer, i64 0, i64 0, !dbg !88
  store i64* %arraydecay, i64** %data, align 8, !dbg !90
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !91, metadata !DIExpression()), !dbg !93
  %1 = bitcast [100 x i64]* %source to i8*, !dbg !93
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 800, i1 false), !dbg !93
  %2 = load i64*, i64** %data, align 8, !dbg !94
  %3 = bitcast i64* %2 to i8*, !dbg !95
  %arraydecay1 = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !95
  %4 = bitcast i64* %arraydecay1 to i8*, !dbg !95
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %3, i8* align 16 %4, i64 800, i1 false), !dbg !95
  %5 = load i64*, i64** %data, align 8, !dbg !96
  %arrayidx = getelementptr inbounds i64, i64* %5, i64 0, !dbg !96
  %6 = load i64, i64* %arrayidx, align 8, !dbg !96
  call void @printLongLongLine(i64 %6), !dbg !97
  ret void, !dbg !98
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !99 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca [50 x i64], align 16
  %dataGoodBuffer = alloca [100 x i64], align 16
  %source = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !100, metadata !DIExpression()), !dbg !101
  call void @llvm.dbg.declare(metadata [50 x i64]* %dataBadBuffer, metadata !102, metadata !DIExpression()), !dbg !103
  call void @llvm.dbg.declare(metadata [100 x i64]* %dataGoodBuffer, metadata !104, metadata !DIExpression()), !dbg !105
  %0 = load i32, i32* @globalFive, align 4, !dbg !106
  %cmp = icmp eq i32 %0, 5, !dbg !108
  br i1 %cmp, label %if.then, label %if.end, !dbg !109

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %dataGoodBuffer, i64 0, i64 0, !dbg !110
  store i64* %arraydecay, i64** %data, align 8, !dbg !112
  br label %if.end, !dbg !113

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !114, metadata !DIExpression()), !dbg !116
  %1 = bitcast [100 x i64]* %source to i8*, !dbg !116
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 800, i1 false), !dbg !116
  %2 = load i64*, i64** %data, align 8, !dbg !117
  %3 = bitcast i64* %2 to i8*, !dbg !118
  %arraydecay1 = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !118
  %4 = bitcast i64* %arraydecay1 to i8*, !dbg !118
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %3, i8* align 16 %4, i64 800, i1 false), !dbg !118
  %5 = load i64*, i64** %data, align 8, !dbg !119
  %arrayidx = getelementptr inbounds i64, i64* %5, i64 0, !dbg !119
  %6 = load i64, i64* %arrayidx, align 8, !dbg !119
  call void @printLongLongLine(i64 %6), !dbg !120
  ret void, !dbg !121
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_14.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_14_bad", scope: !12, file: !12, line: 21, type: !13, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_14.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 23, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !18, line: 27, baseType: !19)
!18 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!19 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !20, line: 44, baseType: !21)
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
!35 = !DILocation(line: 26, column: 18, scope: !34)
!36 = !DILocation(line: 26, column: 8, scope: !11)
!37 = !DILocation(line: 30, column: 16, scope: !38)
!38 = distinct !DILexicalBlock(scope: !34, file: !12, line: 27, column: 5)
!39 = !DILocation(line: 30, column: 14, scope: !38)
!40 = !DILocation(line: 31, column: 5, scope: !38)
!41 = !DILocalVariable(name: "source", scope: !42, file: !12, line: 33, type: !29)
!42 = distinct !DILexicalBlock(scope: !11, file: !12, line: 32, column: 5)
!43 = !DILocation(line: 33, column: 17, scope: !42)
!44 = !DILocation(line: 35, column: 17, scope: !42)
!45 = !DILocation(line: 35, column: 9, scope: !42)
!46 = !DILocation(line: 36, column: 27, scope: !42)
!47 = !DILocation(line: 36, column: 9, scope: !42)
!48 = !DILocation(line: 38, column: 1, scope: !11)
!49 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_14_good", scope: !12, file: !12, line: 87, type: !13, scopeLine: 88, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!50 = !DILocation(line: 89, column: 5, scope: !49)
!51 = !DILocation(line: 90, column: 5, scope: !49)
!52 = !DILocation(line: 91, column: 1, scope: !49)
!53 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 103, type: !54, scopeLine: 104, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!54 = !DISubroutineType(types: !55)
!55 = !{!56, !56, !57}
!56 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!57 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !58, size: 64)
!58 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !59, size: 64)
!59 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!60 = !DILocalVariable(name: "argc", arg: 1, scope: !53, file: !12, line: 103, type: !56)
!61 = !DILocation(line: 103, column: 14, scope: !53)
!62 = !DILocalVariable(name: "argv", arg: 2, scope: !53, file: !12, line: 103, type: !57)
!63 = !DILocation(line: 103, column: 27, scope: !53)
!64 = !DILocation(line: 106, column: 22, scope: !53)
!65 = !DILocation(line: 106, column: 12, scope: !53)
!66 = !DILocation(line: 106, column: 5, scope: !53)
!67 = !DILocation(line: 108, column: 5, scope: !53)
!68 = !DILocation(line: 109, column: 5, scope: !53)
!69 = !DILocation(line: 110, column: 5, scope: !53)
!70 = !DILocation(line: 113, column: 5, scope: !53)
!71 = !DILocation(line: 114, column: 5, scope: !53)
!72 = !DILocation(line: 115, column: 5, scope: !53)
!73 = !DILocation(line: 117, column: 5, scope: !53)
!74 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 45, type: !13, scopeLine: 46, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!75 = !DILocalVariable(name: "data", scope: !74, file: !12, line: 47, type: !16)
!76 = !DILocation(line: 47, column: 15, scope: !74)
!77 = !DILocalVariable(name: "dataBadBuffer", scope: !74, file: !12, line: 48, type: !24)
!78 = !DILocation(line: 48, column: 13, scope: !74)
!79 = !DILocalVariable(name: "dataGoodBuffer", scope: !74, file: !12, line: 49, type: !29)
!80 = !DILocation(line: 49, column: 13, scope: !74)
!81 = !DILocation(line: 50, column: 8, scope: !82)
!82 = distinct !DILexicalBlock(scope: !74, file: !12, line: 50, column: 8)
!83 = !DILocation(line: 50, column: 18, scope: !82)
!84 = !DILocation(line: 50, column: 8, scope: !74)
!85 = !DILocation(line: 53, column: 9, scope: !86)
!86 = distinct !DILexicalBlock(scope: !82, file: !12, line: 51, column: 5)
!87 = !DILocation(line: 54, column: 5, scope: !86)
!88 = !DILocation(line: 58, column: 16, scope: !89)
!89 = distinct !DILexicalBlock(scope: !82, file: !12, line: 56, column: 5)
!90 = !DILocation(line: 58, column: 14, scope: !89)
!91 = !DILocalVariable(name: "source", scope: !92, file: !12, line: 61, type: !29)
!92 = distinct !DILexicalBlock(scope: !74, file: !12, line: 60, column: 5)
!93 = !DILocation(line: 61, column: 17, scope: !92)
!94 = !DILocation(line: 63, column: 17, scope: !92)
!95 = !DILocation(line: 63, column: 9, scope: !92)
!96 = !DILocation(line: 64, column: 27, scope: !92)
!97 = !DILocation(line: 64, column: 9, scope: !92)
!98 = !DILocation(line: 66, column: 1, scope: !74)
!99 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 69, type: !13, scopeLine: 70, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!100 = !DILocalVariable(name: "data", scope: !99, file: !12, line: 71, type: !16)
!101 = !DILocation(line: 71, column: 15, scope: !99)
!102 = !DILocalVariable(name: "dataBadBuffer", scope: !99, file: !12, line: 72, type: !24)
!103 = !DILocation(line: 72, column: 13, scope: !99)
!104 = !DILocalVariable(name: "dataGoodBuffer", scope: !99, file: !12, line: 73, type: !29)
!105 = !DILocation(line: 73, column: 13, scope: !99)
!106 = !DILocation(line: 74, column: 8, scope: !107)
!107 = distinct !DILexicalBlock(scope: !99, file: !12, line: 74, column: 8)
!108 = !DILocation(line: 74, column: 18, scope: !107)
!109 = !DILocation(line: 74, column: 8, scope: !99)
!110 = !DILocation(line: 77, column: 16, scope: !111)
!111 = distinct !DILexicalBlock(scope: !107, file: !12, line: 75, column: 5)
!112 = !DILocation(line: 77, column: 14, scope: !111)
!113 = !DILocation(line: 78, column: 5, scope: !111)
!114 = !DILocalVariable(name: "source", scope: !115, file: !12, line: 80, type: !29)
!115 = distinct !DILexicalBlock(scope: !99, file: !12, line: 79, column: 5)
!116 = !DILocation(line: 80, column: 17, scope: !115)
!117 = !DILocation(line: 82, column: 17, scope: !115)
!118 = !DILocation(line: 82, column: 9, scope: !115)
!119 = !DILocation(line: 83, column: 27, scope: !115)
!120 = !DILocation(line: 83, column: 9, scope: !115)
!121 = !DILocation(line: 85, column: 1, scope: !99)
