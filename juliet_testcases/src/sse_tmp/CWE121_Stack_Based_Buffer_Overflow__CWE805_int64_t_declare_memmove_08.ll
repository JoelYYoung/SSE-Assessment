; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_08.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_08.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_08_bad() #0 !dbg !11 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca [50 x i64], align 16
  %dataGoodBuffer = alloca [100 x i64], align 16
  %source = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !15, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata [50 x i64]* %dataBadBuffer, metadata !23, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.declare(metadata [100 x i64]* %dataGoodBuffer, metadata !28, metadata !DIExpression()), !dbg !32
  %call = call i32 @staticReturnsTrue(), !dbg !33
  %tobool = icmp ne i32 %call, 0, !dbg !33
  br i1 %tobool, label %if.then, label %if.end, !dbg !35

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [50 x i64], [50 x i64]* %dataBadBuffer, i64 0, i64 0, !dbg !36
  store i64* %arraydecay, i64** %data, align 8, !dbg !38
  br label %if.end, !dbg !39

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !40, metadata !DIExpression()), !dbg !42
  %0 = bitcast [100 x i64]* %source to i8*, !dbg !42
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 800, i1 false), !dbg !42
  %1 = load i64*, i64** %data, align 8, !dbg !43
  %2 = bitcast i64* %1 to i8*, !dbg !44
  %arraydecay1 = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !44
  %3 = bitcast i64* %arraydecay1 to i8*, !dbg !44
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %2, i8* align 16 %3, i64 800, i1 false), !dbg !44
  %4 = load i64*, i64** %data, align 8, !dbg !45
  %arrayidx = getelementptr inbounds i64, i64* %4, i64 0, !dbg !45
  %5 = load i64, i64* %arrayidx, align 8, !dbg !45
  call void @printLongLongLine(i64 %5), !dbg !46
  ret void, !dbg !47
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printLongLongLine(i64) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_08_good() #0 !dbg !48 {
entry:
  call void @goodG2B1(), !dbg !49
  call void @goodG2B2(), !dbg !50
  ret void, !dbg !51
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !52 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !59, metadata !DIExpression()), !dbg !60
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !61, metadata !DIExpression()), !dbg !62
  %call = call i64 @time(i64* null) #6, !dbg !63
  %conv = trunc i64 %call to i32, !dbg !64
  call void @srand(i32 %conv) #6, !dbg !65
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !66
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_08_good(), !dbg !67
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !69
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_08_bad(), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !71
  ret i32 0, !dbg !72
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !73 {
entry:
  ret i32 1, !dbg !76
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !77 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca [50 x i64], align 16
  %dataGoodBuffer = alloca [100 x i64], align 16
  %source = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !78, metadata !DIExpression()), !dbg !79
  call void @llvm.dbg.declare(metadata [50 x i64]* %dataBadBuffer, metadata !80, metadata !DIExpression()), !dbg !81
  call void @llvm.dbg.declare(metadata [100 x i64]* %dataGoodBuffer, metadata !82, metadata !DIExpression()), !dbg !83
  %call = call i32 @staticReturnsFalse(), !dbg !84
  %tobool = icmp ne i32 %call, 0, !dbg !84
  br i1 %tobool, label %if.then, label %if.else, !dbg !86

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !87
  br label %if.end, !dbg !89

if.else:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %dataGoodBuffer, i64 0, i64 0, !dbg !90
  store i64* %arraydecay, i64** %data, align 8, !dbg !92
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !93, metadata !DIExpression()), !dbg !95
  %0 = bitcast [100 x i64]* %source to i8*, !dbg !95
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 800, i1 false), !dbg !95
  %1 = load i64*, i64** %data, align 8, !dbg !96
  %2 = bitcast i64* %1 to i8*, !dbg !97
  %arraydecay1 = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !97
  %3 = bitcast i64* %arraydecay1 to i8*, !dbg !97
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %2, i8* align 16 %3, i64 800, i1 false), !dbg !97
  %4 = load i64*, i64** %data, align 8, !dbg !98
  %arrayidx = getelementptr inbounds i64, i64* %4, i64 0, !dbg !98
  %5 = load i64, i64* %arrayidx, align 8, !dbg !98
  call void @printLongLongLine(i64 %5), !dbg !99
  ret void, !dbg !100
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !101 {
entry:
  ret i32 0, !dbg !102
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !103 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca [50 x i64], align 16
  %dataGoodBuffer = alloca [100 x i64], align 16
  %source = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !104, metadata !DIExpression()), !dbg !105
  call void @llvm.dbg.declare(metadata [50 x i64]* %dataBadBuffer, metadata !106, metadata !DIExpression()), !dbg !107
  call void @llvm.dbg.declare(metadata [100 x i64]* %dataGoodBuffer, metadata !108, metadata !DIExpression()), !dbg !109
  %call = call i32 @staticReturnsTrue(), !dbg !110
  %tobool = icmp ne i32 %call, 0, !dbg !110
  br i1 %tobool, label %if.then, label %if.end, !dbg !112

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %dataGoodBuffer, i64 0, i64 0, !dbg !113
  store i64* %arraydecay, i64** %data, align 8, !dbg !115
  br label %if.end, !dbg !116

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !117, metadata !DIExpression()), !dbg !119
  %0 = bitcast [100 x i64]* %source to i8*, !dbg !119
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 800, i1 false), !dbg !119
  %1 = load i64*, i64** %data, align 8, !dbg !120
  %2 = bitcast i64* %1 to i8*, !dbg !121
  %arraydecay1 = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !121
  %3 = bitcast i64* %arraydecay1 to i8*, !dbg !121
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %2, i8* align 16 %3, i64 800, i1 false), !dbg !121
  %4 = load i64*, i64** %data, align 8, !dbg !122
  %arrayidx = getelementptr inbounds i64, i64* %4, i64 0, !dbg !122
  %5 = load i64, i64* %arrayidx, align 8, !dbg !122
  call void @printLongLongLine(i64 %5), !dbg !123
  ret void, !dbg !124
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_08.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_08_bad", scope: !12, file: !12, line: 35, type: !13, scopeLine: 36, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_08.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 37, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !18, line: 27, baseType: !19)
!18 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!19 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !20, line: 43, baseType: !21)
!20 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!21 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!22 = !DILocation(line: 37, column: 15, scope: !11)
!23 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 38, type: !24)
!24 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !25)
!25 = !{!26}
!26 = !DISubrange(count: 50)
!27 = !DILocation(line: 38, column: 13, scope: !11)
!28 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 39, type: !29)
!29 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 6400, elements: !30)
!30 = !{!31}
!31 = !DISubrange(count: 100)
!32 = !DILocation(line: 39, column: 13, scope: !11)
!33 = !DILocation(line: 40, column: 8, scope: !34)
!34 = distinct !DILexicalBlock(scope: !11, file: !12, line: 40, column: 8)
!35 = !DILocation(line: 40, column: 8, scope: !11)
!36 = !DILocation(line: 44, column: 16, scope: !37)
!37 = distinct !DILexicalBlock(scope: !34, file: !12, line: 41, column: 5)
!38 = !DILocation(line: 44, column: 14, scope: !37)
!39 = !DILocation(line: 45, column: 5, scope: !37)
!40 = !DILocalVariable(name: "source", scope: !41, file: !12, line: 47, type: !29)
!41 = distinct !DILexicalBlock(scope: !11, file: !12, line: 46, column: 5)
!42 = !DILocation(line: 47, column: 17, scope: !41)
!43 = !DILocation(line: 49, column: 17, scope: !41)
!44 = !DILocation(line: 49, column: 9, scope: !41)
!45 = !DILocation(line: 50, column: 27, scope: !41)
!46 = !DILocation(line: 50, column: 9, scope: !41)
!47 = !DILocation(line: 52, column: 1, scope: !11)
!48 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_08_good", scope: !12, file: !12, line: 101, type: !13, scopeLine: 102, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!49 = !DILocation(line: 103, column: 5, scope: !48)
!50 = !DILocation(line: 104, column: 5, scope: !48)
!51 = !DILocation(line: 105, column: 1, scope: !48)
!52 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 117, type: !53, scopeLine: 118, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!53 = !DISubroutineType(types: !54)
!54 = !{!55, !55, !56}
!55 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!56 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !57, size: 64)
!57 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !58, size: 64)
!58 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!59 = !DILocalVariable(name: "argc", arg: 1, scope: !52, file: !12, line: 117, type: !55)
!60 = !DILocation(line: 117, column: 14, scope: !52)
!61 = !DILocalVariable(name: "argv", arg: 2, scope: !52, file: !12, line: 117, type: !56)
!62 = !DILocation(line: 117, column: 27, scope: !52)
!63 = !DILocation(line: 120, column: 22, scope: !52)
!64 = !DILocation(line: 120, column: 12, scope: !52)
!65 = !DILocation(line: 120, column: 5, scope: !52)
!66 = !DILocation(line: 122, column: 5, scope: !52)
!67 = !DILocation(line: 123, column: 5, scope: !52)
!68 = !DILocation(line: 124, column: 5, scope: !52)
!69 = !DILocation(line: 127, column: 5, scope: !52)
!70 = !DILocation(line: 128, column: 5, scope: !52)
!71 = !DILocation(line: 129, column: 5, scope: !52)
!72 = !DILocation(line: 131, column: 5, scope: !52)
!73 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !12, file: !12, line: 23, type: !74, scopeLine: 24, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!74 = !DISubroutineType(types: !75)
!75 = !{!55}
!76 = !DILocation(line: 25, column: 5, scope: !73)
!77 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 59, type: !13, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!78 = !DILocalVariable(name: "data", scope: !77, file: !12, line: 61, type: !16)
!79 = !DILocation(line: 61, column: 15, scope: !77)
!80 = !DILocalVariable(name: "dataBadBuffer", scope: !77, file: !12, line: 62, type: !24)
!81 = !DILocation(line: 62, column: 13, scope: !77)
!82 = !DILocalVariable(name: "dataGoodBuffer", scope: !77, file: !12, line: 63, type: !29)
!83 = !DILocation(line: 63, column: 13, scope: !77)
!84 = !DILocation(line: 64, column: 8, scope: !85)
!85 = distinct !DILexicalBlock(scope: !77, file: !12, line: 64, column: 8)
!86 = !DILocation(line: 64, column: 8, scope: !77)
!87 = !DILocation(line: 67, column: 9, scope: !88)
!88 = distinct !DILexicalBlock(scope: !85, file: !12, line: 65, column: 5)
!89 = !DILocation(line: 68, column: 5, scope: !88)
!90 = !DILocation(line: 72, column: 16, scope: !91)
!91 = distinct !DILexicalBlock(scope: !85, file: !12, line: 70, column: 5)
!92 = !DILocation(line: 72, column: 14, scope: !91)
!93 = !DILocalVariable(name: "source", scope: !94, file: !12, line: 75, type: !29)
!94 = distinct !DILexicalBlock(scope: !77, file: !12, line: 74, column: 5)
!95 = !DILocation(line: 75, column: 17, scope: !94)
!96 = !DILocation(line: 77, column: 17, scope: !94)
!97 = !DILocation(line: 77, column: 9, scope: !94)
!98 = !DILocation(line: 78, column: 27, scope: !94)
!99 = !DILocation(line: 78, column: 9, scope: !94)
!100 = !DILocation(line: 80, column: 1, scope: !77)
!101 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !12, file: !12, line: 28, type: !74, scopeLine: 29, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!102 = !DILocation(line: 30, column: 5, scope: !101)
!103 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 83, type: !13, scopeLine: 84, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!104 = !DILocalVariable(name: "data", scope: !103, file: !12, line: 85, type: !16)
!105 = !DILocation(line: 85, column: 15, scope: !103)
!106 = !DILocalVariable(name: "dataBadBuffer", scope: !103, file: !12, line: 86, type: !24)
!107 = !DILocation(line: 86, column: 13, scope: !103)
!108 = !DILocalVariable(name: "dataGoodBuffer", scope: !103, file: !12, line: 87, type: !29)
!109 = !DILocation(line: 87, column: 13, scope: !103)
!110 = !DILocation(line: 88, column: 8, scope: !111)
!111 = distinct !DILexicalBlock(scope: !103, file: !12, line: 88, column: 8)
!112 = !DILocation(line: 88, column: 8, scope: !103)
!113 = !DILocation(line: 91, column: 16, scope: !114)
!114 = distinct !DILexicalBlock(scope: !111, file: !12, line: 89, column: 5)
!115 = !DILocation(line: 91, column: 14, scope: !114)
!116 = !DILocation(line: 92, column: 5, scope: !114)
!117 = !DILocalVariable(name: "source", scope: !118, file: !12, line: 94, type: !29)
!118 = distinct !DILexicalBlock(scope: !103, file: !12, line: 93, column: 5)
!119 = !DILocation(line: 94, column: 17, scope: !118)
!120 = !DILocation(line: 96, column: 17, scope: !118)
!121 = !DILocation(line: 96, column: 9, scope: !118)
!122 = !DILocation(line: 97, column: 27, scope: !118)
!123 = !DILocation(line: 97, column: 9, scope: !118)
!124 = !DILocation(line: 99, column: 1, scope: !103)
