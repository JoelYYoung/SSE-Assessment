; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_memcpy_68a.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_memcpy_68a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE126_Buffer_Overread__char_alloca_memcpy_68_badData = dso_local global i8* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@CWE126_Buffer_Overread__char_alloca_memcpy_68_goodG2BData = dso_local global i8* null, align 8, !dbg !10

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__char_alloca_memcpy_68_bad() #0 !dbg !19 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !24, metadata !DIExpression()), !dbg !25
  %0 = alloca i8, i64 50, align 16, !dbg !26
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !27, metadata !DIExpression()), !dbg !28
  %1 = alloca i8, i64 100, align 16, !dbg !29
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !28
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !30
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !31
  %3 = load i8*, i8** %dataBadBuffer, align 8, !dbg !32
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !32
  store i8 0, i8* %arrayidx, align 1, !dbg !33
  %4 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !34
  call void @llvm.memset.p0i8.i64(i8* align 1 %4, i8 65, i64 99, i1 false), !dbg !35
  %5 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !36
  %arrayidx1 = getelementptr inbounds i8, i8* %5, i64 99, !dbg !36
  store i8 0, i8* %arrayidx1, align 1, !dbg !37
  %6 = load i8*, i8** %dataBadBuffer, align 8, !dbg !38
  store i8* %6, i8** %data, align 8, !dbg !39
  %7 = load i8*, i8** %data, align 8, !dbg !40
  store i8* %7, i8** @CWE126_Buffer_Overread__char_alloca_memcpy_68_badData, align 8, !dbg !41
  call void (...) @CWE126_Buffer_Overread__char_alloca_memcpy_68b_badSink(), !dbg !42
  ret void, !dbg !43
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @CWE126_Buffer_Overread__char_alloca_memcpy_68b_badSink(...) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__char_alloca_memcpy_68_good() #0 !dbg !44 {
entry:
  call void @goodG2B(), !dbg !45
  ret void, !dbg !46
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !47 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !52, metadata !DIExpression()), !dbg !53
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !54, metadata !DIExpression()), !dbg !55
  %call = call i64 @time(i64* null) #5, !dbg !56
  %conv = trunc i64 %call to i32, !dbg !57
  call void @srand(i32 %conv) #5, !dbg !58
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !59
  call void @CWE126_Buffer_Overread__char_alloca_memcpy_68_good(), !dbg !60
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !61
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !62
  call void @CWE126_Buffer_Overread__char_alloca_memcpy_68_bad(), !dbg !63
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !64
  ret i32 0, !dbg !65
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !66 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !67, metadata !DIExpression()), !dbg !68
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !69, metadata !DIExpression()), !dbg !70
  %0 = alloca i8, i64 50, align 16, !dbg !71
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !70
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !72, metadata !DIExpression()), !dbg !73
  %1 = alloca i8, i64 100, align 16, !dbg !74
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !73
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !75
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !76
  %3 = load i8*, i8** %dataBadBuffer, align 8, !dbg !77
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !77
  store i8 0, i8* %arrayidx, align 1, !dbg !78
  %4 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !79
  call void @llvm.memset.p0i8.i64(i8* align 1 %4, i8 65, i64 99, i1 false), !dbg !80
  %5 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !81
  %arrayidx1 = getelementptr inbounds i8, i8* %5, i64 99, !dbg !81
  store i8 0, i8* %arrayidx1, align 1, !dbg !82
  %6 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !83
  store i8* %6, i8** %data, align 8, !dbg !84
  %7 = load i8*, i8** %data, align 8, !dbg !85
  store i8* %7, i8** @CWE126_Buffer_Overread__char_alloca_memcpy_68_goodG2BData, align 8, !dbg !86
  call void (...) @CWE126_Buffer_Overread__char_alloca_memcpy_68b_goodG2BSink(), !dbg !87
  ret void, !dbg !88
}

declare dso_local void @CWE126_Buffer_Overread__char_alloca_memcpy_68b_goodG2BSink(...) #3

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!13, !14, !15, !16, !17}
!llvm.ident = !{!18}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE126_Buffer_Overread__char_alloca_memcpy_68_badData", scope: !2, file: !12, line: 21, type: !6, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !9, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_memcpy_68a.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !8}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{!0, !10}
!10 = !DIGlobalVariableExpression(var: !11, expr: !DIExpression())
!11 = distinct !DIGlobalVariable(name: "CWE126_Buffer_Overread__char_alloca_memcpy_68_goodG2BData", scope: !2, file: !12, line: 22, type: !6, isLocal: false, isDefinition: true)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_memcpy_68a.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !{i32 7, !"Dwarf Version", i32 4}
!14 = !{i32 2, !"Debug Info Version", i32 3}
!15 = !{i32 1, !"wchar_size", i32 4}
!16 = !{i32 7, !"uwtable", i32 1}
!17 = !{i32 7, !"frame-pointer", i32 2}
!18 = !{!"clang version 13.0.0"}
!19 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_alloca_memcpy_68_bad", scope: !12, file: !12, line: 29, type: !20, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !DILocalVariable(name: "data", scope: !19, file: !12, line: 31, type: !6)
!23 = !DILocation(line: 31, column: 12, scope: !19)
!24 = !DILocalVariable(name: "dataBadBuffer", scope: !19, file: !12, line: 32, type: !6)
!25 = !DILocation(line: 32, column: 12, scope: !19)
!26 = !DILocation(line: 32, column: 36, scope: !19)
!27 = !DILocalVariable(name: "dataGoodBuffer", scope: !19, file: !12, line: 33, type: !6)
!28 = !DILocation(line: 33, column: 12, scope: !19)
!29 = !DILocation(line: 33, column: 37, scope: !19)
!30 = !DILocation(line: 34, column: 12, scope: !19)
!31 = !DILocation(line: 34, column: 5, scope: !19)
!32 = !DILocation(line: 35, column: 5, scope: !19)
!33 = !DILocation(line: 35, column: 25, scope: !19)
!34 = !DILocation(line: 36, column: 12, scope: !19)
!35 = !DILocation(line: 36, column: 5, scope: !19)
!36 = !DILocation(line: 37, column: 5, scope: !19)
!37 = !DILocation(line: 37, column: 27, scope: !19)
!38 = !DILocation(line: 39, column: 12, scope: !19)
!39 = !DILocation(line: 39, column: 10, scope: !19)
!40 = !DILocation(line: 40, column: 61, scope: !19)
!41 = !DILocation(line: 40, column: 59, scope: !19)
!42 = !DILocation(line: 41, column: 5, scope: !19)
!43 = !DILocation(line: 42, column: 1, scope: !19)
!44 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_alloca_memcpy_68_good", scope: !12, file: !12, line: 67, type: !20, scopeLine: 68, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!45 = !DILocation(line: 69, column: 5, scope: !44)
!46 = !DILocation(line: 70, column: 1, scope: !44)
!47 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 82, type: !48, scopeLine: 83, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!48 = !DISubroutineType(types: !49)
!49 = !{!50, !50, !51}
!50 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!51 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!52 = !DILocalVariable(name: "argc", arg: 1, scope: !47, file: !12, line: 82, type: !50)
!53 = !DILocation(line: 82, column: 14, scope: !47)
!54 = !DILocalVariable(name: "argv", arg: 2, scope: !47, file: !12, line: 82, type: !51)
!55 = !DILocation(line: 82, column: 27, scope: !47)
!56 = !DILocation(line: 85, column: 22, scope: !47)
!57 = !DILocation(line: 85, column: 12, scope: !47)
!58 = !DILocation(line: 85, column: 5, scope: !47)
!59 = !DILocation(line: 87, column: 5, scope: !47)
!60 = !DILocation(line: 88, column: 5, scope: !47)
!61 = !DILocation(line: 89, column: 5, scope: !47)
!62 = !DILocation(line: 92, column: 5, scope: !47)
!63 = !DILocation(line: 93, column: 5, scope: !47)
!64 = !DILocation(line: 94, column: 5, scope: !47)
!65 = !DILocation(line: 96, column: 5, scope: !47)
!66 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 52, type: !20, scopeLine: 53, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!67 = !DILocalVariable(name: "data", scope: !66, file: !12, line: 54, type: !6)
!68 = !DILocation(line: 54, column: 12, scope: !66)
!69 = !DILocalVariable(name: "dataBadBuffer", scope: !66, file: !12, line: 55, type: !6)
!70 = !DILocation(line: 55, column: 12, scope: !66)
!71 = !DILocation(line: 55, column: 36, scope: !66)
!72 = !DILocalVariable(name: "dataGoodBuffer", scope: !66, file: !12, line: 56, type: !6)
!73 = !DILocation(line: 56, column: 12, scope: !66)
!74 = !DILocation(line: 56, column: 37, scope: !66)
!75 = !DILocation(line: 57, column: 12, scope: !66)
!76 = !DILocation(line: 57, column: 5, scope: !66)
!77 = !DILocation(line: 58, column: 5, scope: !66)
!78 = !DILocation(line: 58, column: 25, scope: !66)
!79 = !DILocation(line: 59, column: 12, scope: !66)
!80 = !DILocation(line: 59, column: 5, scope: !66)
!81 = !DILocation(line: 60, column: 5, scope: !66)
!82 = !DILocation(line: 60, column: 27, scope: !66)
!83 = !DILocation(line: 62, column: 12, scope: !66)
!84 = !DILocation(line: 62, column: 10, scope: !66)
!85 = !DILocation(line: 63, column: 65, scope: !66)
!86 = !DILocation(line: 63, column: 63, scope: !66)
!87 = !DILocation(line: 64, column: 5, scope: !66)
!88 = !DILocation(line: 65, column: 1, scope: !66)
