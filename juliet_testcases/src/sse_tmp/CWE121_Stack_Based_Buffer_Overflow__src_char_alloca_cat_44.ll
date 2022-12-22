; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cat_44.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cat_44.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cat_44_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %funcPtr = alloca void (i8*)*, align 8
  %dataBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata void (i8*)** %funcPtr, metadata !19, metadata !DIExpression()), !dbg !23
  store void (i8*)* @badSink, void (i8*)** %funcPtr, align 8, !dbg !23
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !24, metadata !DIExpression()), !dbg !25
  %0 = alloca i8, i64 100, align 16, !dbg !26
  store i8* %0, i8** %dataBuffer, align 8, !dbg !25
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !27
  store i8* %1, i8** %data, align 8, !dbg !28
  %2 = load i8*, i8** %data, align 8, !dbg !29
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !30
  %3 = load i8*, i8** %data, align 8, !dbg !31
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !31
  store i8 0, i8* %arrayidx, align 1, !dbg !32
  %4 = load void (i8*)*, void (i8*)** %funcPtr, align 8, !dbg !33
  %5 = load i8*, i8** %data, align 8, !dbg !34
  call void %4(i8* %5), !dbg !33
  ret void, !dbg !35
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal void @badSink(i8* %data) #0 !dbg !36 {
entry:
  %data.addr = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !37, metadata !DIExpression()), !dbg !38
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !39, metadata !DIExpression()), !dbg !44
  %0 = bitcast [50 x i8]* %dest to i8*, !dbg !44
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 50, i1 false), !dbg !44
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !45
  %1 = load i8*, i8** %data.addr, align 8, !dbg !46
  %call = call i8* @strcat(i8* %arraydecay, i8* %1) #5, !dbg !47
  %2 = load i8*, i8** %data.addr, align 8, !dbg !48
  call void @printLine(i8* %2), !dbg !49
  ret void, !dbg !50
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cat_44_good() #0 !dbg !51 {
entry:
  call void @goodG2B(), !dbg !52
  ret void, !dbg !53
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !54 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !59, metadata !DIExpression()), !dbg !60
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !61, metadata !DIExpression()), !dbg !62
  %call = call i64 @time(i64* null) #5, !dbg !63
  %conv = trunc i64 %call to i32, !dbg !64
  call void @srand(i32 %conv) #5, !dbg !65
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !66
  call void @CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cat_44_good(), !dbg !67
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !69
  call void @CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cat_44_bad(), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !71
  ret i32 0, !dbg !72
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: nounwind
declare dso_local i8* @strcat(i8*, i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !73 {
entry:
  %data = alloca i8*, align 8
  %funcPtr = alloca void (i8*)*, align 8
  %dataBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !74, metadata !DIExpression()), !dbg !75
  call void @llvm.dbg.declare(metadata void (i8*)** %funcPtr, metadata !76, metadata !DIExpression()), !dbg !77
  store void (i8*)* @goodG2BSink, void (i8*)** %funcPtr, align 8, !dbg !77
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !78, metadata !DIExpression()), !dbg !79
  %0 = alloca i8, i64 100, align 16, !dbg !80
  store i8* %0, i8** %dataBuffer, align 8, !dbg !79
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !81
  store i8* %1, i8** %data, align 8, !dbg !82
  %2 = load i8*, i8** %data, align 8, !dbg !83
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !84
  %3 = load i8*, i8** %data, align 8, !dbg !85
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !85
  store i8 0, i8* %arrayidx, align 1, !dbg !86
  %4 = load void (i8*)*, void (i8*)** %funcPtr, align 8, !dbg !87
  %5 = load i8*, i8** %data, align 8, !dbg !88
  call void %4(i8* %5), !dbg !87
  ret void, !dbg !89
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink(i8* %data) #0 !dbg !90 {
entry:
  %data.addr = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !91, metadata !DIExpression()), !dbg !92
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !93, metadata !DIExpression()), !dbg !95
  %0 = bitcast [50 x i8]* %dest to i8*, !dbg !95
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 50, i1 false), !dbg !95
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !96
  %1 = load i8*, i8** %data.addr, align 8, !dbg !97
  %call = call i8* @strcat(i8* %arraydecay, i8* %1) #5, !dbg !98
  %2 = load i8*, i8** %data.addr, align 8, !dbg !99
  call void @printLine(i8* %2), !dbg !100
  ret void, !dbg !101
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cat_44.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"uwtable", i32 1}
!11 = !{i32 7, !"frame-pointer", i32 2}
!12 = !{!"clang version 13.0.0"}
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cat_44_bad", scope: !14, file: !14, line: 33, type: !15, scopeLine: 34, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cat_44.c", directory: "/root/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 35, type: !4)
!18 = !DILocation(line: 35, column: 12, scope: !13)
!19 = !DILocalVariable(name: "funcPtr", scope: !13, file: !14, line: 37, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!21 = !DISubroutineType(types: !22)
!22 = !{null, !4}
!23 = !DILocation(line: 37, column: 12, scope: !13)
!24 = !DILocalVariable(name: "dataBuffer", scope: !13, file: !14, line: 38, type: !4)
!25 = !DILocation(line: 38, column: 12, scope: !13)
!26 = !DILocation(line: 38, column: 33, scope: !13)
!27 = !DILocation(line: 39, column: 12, scope: !13)
!28 = !DILocation(line: 39, column: 10, scope: !13)
!29 = !DILocation(line: 41, column: 12, scope: !13)
!30 = !DILocation(line: 41, column: 5, scope: !13)
!31 = !DILocation(line: 42, column: 5, scope: !13)
!32 = !DILocation(line: 42, column: 17, scope: !13)
!33 = !DILocation(line: 44, column: 5, scope: !13)
!34 = !DILocation(line: 44, column: 13, scope: !13)
!35 = !DILocation(line: 45, column: 1, scope: !13)
!36 = distinct !DISubprogram(name: "badSink", scope: !14, file: !14, line: 23, type: !21, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!37 = !DILocalVariable(name: "data", arg: 1, scope: !36, file: !14, line: 23, type: !4)
!38 = !DILocation(line: 23, column: 28, scope: !36)
!39 = !DILocalVariable(name: "dest", scope: !40, file: !14, line: 26, type: !41)
!40 = distinct !DILexicalBlock(scope: !36, file: !14, line: 25, column: 5)
!41 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 400, elements: !42)
!42 = !{!43}
!43 = !DISubrange(count: 50)
!44 = !DILocation(line: 26, column: 14, scope: !40)
!45 = !DILocation(line: 28, column: 16, scope: !40)
!46 = !DILocation(line: 28, column: 22, scope: !40)
!47 = !DILocation(line: 28, column: 9, scope: !40)
!48 = !DILocation(line: 29, column: 19, scope: !40)
!49 = !DILocation(line: 29, column: 9, scope: !40)
!50 = !DILocation(line: 31, column: 1, scope: !36)
!51 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cat_44_good", scope: !14, file: !14, line: 74, type: !15, scopeLine: 75, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!52 = !DILocation(line: 76, column: 5, scope: !51)
!53 = !DILocation(line: 77, column: 1, scope: !51)
!54 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 88, type: !55, scopeLine: 89, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!55 = !DISubroutineType(types: !56)
!56 = !{!57, !57, !58}
!57 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!58 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!59 = !DILocalVariable(name: "argc", arg: 1, scope: !54, file: !14, line: 88, type: !57)
!60 = !DILocation(line: 88, column: 14, scope: !54)
!61 = !DILocalVariable(name: "argv", arg: 2, scope: !54, file: !14, line: 88, type: !58)
!62 = !DILocation(line: 88, column: 27, scope: !54)
!63 = !DILocation(line: 91, column: 22, scope: !54)
!64 = !DILocation(line: 91, column: 12, scope: !54)
!65 = !DILocation(line: 91, column: 5, scope: !54)
!66 = !DILocation(line: 93, column: 5, scope: !54)
!67 = !DILocation(line: 94, column: 5, scope: !54)
!68 = !DILocation(line: 95, column: 5, scope: !54)
!69 = !DILocation(line: 98, column: 5, scope: !54)
!70 = !DILocation(line: 99, column: 5, scope: !54)
!71 = !DILocation(line: 100, column: 5, scope: !54)
!72 = !DILocation(line: 102, column: 5, scope: !54)
!73 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 62, type: !15, scopeLine: 63, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!74 = !DILocalVariable(name: "data", scope: !73, file: !14, line: 64, type: !4)
!75 = !DILocation(line: 64, column: 12, scope: !73)
!76 = !DILocalVariable(name: "funcPtr", scope: !73, file: !14, line: 65, type: !20)
!77 = !DILocation(line: 65, column: 12, scope: !73)
!78 = !DILocalVariable(name: "dataBuffer", scope: !73, file: !14, line: 66, type: !4)
!79 = !DILocation(line: 66, column: 12, scope: !73)
!80 = !DILocation(line: 66, column: 33, scope: !73)
!81 = !DILocation(line: 67, column: 12, scope: !73)
!82 = !DILocation(line: 67, column: 10, scope: !73)
!83 = !DILocation(line: 69, column: 12, scope: !73)
!84 = !DILocation(line: 69, column: 5, scope: !73)
!85 = !DILocation(line: 70, column: 5, scope: !73)
!86 = !DILocation(line: 70, column: 16, scope: !73)
!87 = !DILocation(line: 71, column: 5, scope: !73)
!88 = !DILocation(line: 71, column: 13, scope: !73)
!89 = !DILocation(line: 72, column: 1, scope: !73)
!90 = distinct !DISubprogram(name: "goodG2BSink", scope: !14, file: !14, line: 52, type: !21, scopeLine: 53, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!91 = !DILocalVariable(name: "data", arg: 1, scope: !90, file: !14, line: 52, type: !4)
!92 = !DILocation(line: 52, column: 32, scope: !90)
!93 = !DILocalVariable(name: "dest", scope: !94, file: !14, line: 55, type: !41)
!94 = distinct !DILexicalBlock(scope: !90, file: !14, line: 54, column: 5)
!95 = !DILocation(line: 55, column: 14, scope: !94)
!96 = !DILocation(line: 57, column: 16, scope: !94)
!97 = !DILocation(line: 57, column: 22, scope: !94)
!98 = !DILocation(line: 57, column: 9, scope: !94)
!99 = !DILocation(line: 58, column: 19, scope: !94)
!100 = !DILocation(line: 58, column: 9, scope: !94)
!101 = !DILocation(line: 60, column: 1, scope: !90)
