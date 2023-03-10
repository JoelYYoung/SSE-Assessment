; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_memcpy_53a.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_memcpy_53a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__char_alloca_memcpy_53_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !19, metadata !DIExpression()), !dbg !20
  %0 = alloca i8, i64 50, align 16, !dbg !21
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !20
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !22, metadata !DIExpression()), !dbg !23
  %1 = alloca i8, i64 100, align 16, !dbg !24
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !23
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !25
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !26
  %3 = load i8*, i8** %dataBadBuffer, align 8, !dbg !27
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !27
  store i8 0, i8* %arrayidx, align 1, !dbg !28
  %4 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !29
  call void @llvm.memset.p0i8.i64(i8* align 1 %4, i8 65, i64 99, i1 false), !dbg !30
  %5 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !31
  %arrayidx1 = getelementptr inbounds i8, i8* %5, i64 99, !dbg !31
  store i8 0, i8* %arrayidx1, align 1, !dbg !32
  %6 = load i8*, i8** %dataBadBuffer, align 8, !dbg !33
  store i8* %6, i8** %data, align 8, !dbg !34
  %7 = load i8*, i8** %data, align 8, !dbg !35
  call void @CWE126_Buffer_Overread__char_alloca_memcpy_53b_badSink(i8* %7), !dbg !36
  ret void, !dbg !37
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @CWE126_Buffer_Overread__char_alloca_memcpy_53b_badSink(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__char_alloca_memcpy_53_good() #0 !dbg !38 {
entry:
  call void @goodG2B(), !dbg !39
  ret void, !dbg !40
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !41 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !46, metadata !DIExpression()), !dbg !47
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !48, metadata !DIExpression()), !dbg !49
  %call = call i64 @time(i64* null) #5, !dbg !50
  %conv = trunc i64 %call to i32, !dbg !51
  call void @srand(i32 %conv) #5, !dbg !52
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !53
  call void @CWE126_Buffer_Overread__char_alloca_memcpy_53_good(), !dbg !54
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !55
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !56
  call void @CWE126_Buffer_Overread__char_alloca_memcpy_53_bad(), !dbg !57
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !58
  ret i32 0, !dbg !59
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !60 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !61, metadata !DIExpression()), !dbg !62
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !63, metadata !DIExpression()), !dbg !64
  %0 = alloca i8, i64 50, align 16, !dbg !65
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !64
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !66, metadata !DIExpression()), !dbg !67
  %1 = alloca i8, i64 100, align 16, !dbg !68
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !67
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !69
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !70
  %3 = load i8*, i8** %dataBadBuffer, align 8, !dbg !71
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !71
  store i8 0, i8* %arrayidx, align 1, !dbg !72
  %4 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !73
  call void @llvm.memset.p0i8.i64(i8* align 1 %4, i8 65, i64 99, i1 false), !dbg !74
  %5 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !75
  %arrayidx1 = getelementptr inbounds i8, i8* %5, i64 99, !dbg !75
  store i8 0, i8* %arrayidx1, align 1, !dbg !76
  %6 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !77
  store i8* %6, i8** %data, align 8, !dbg !78
  %7 = load i8*, i8** %data, align 8, !dbg !79
  call void @CWE126_Buffer_Overread__char_alloca_memcpy_53b_goodG2BSink(i8* %7), !dbg !80
  ret void, !dbg !81
}

declare dso_local void @CWE126_Buffer_Overread__char_alloca_memcpy_53b_goodG2BSink(i8*) #3

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_memcpy_53a.c", directory: "/home/joelyang/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_alloca_memcpy_53_bad", scope: !14, file: !14, line: 26, type: !15, scopeLine: 27, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_memcpy_53a.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 28, type: !4)
!18 = !DILocation(line: 28, column: 12, scope: !13)
!19 = !DILocalVariable(name: "dataBadBuffer", scope: !13, file: !14, line: 29, type: !4)
!20 = !DILocation(line: 29, column: 12, scope: !13)
!21 = !DILocation(line: 29, column: 36, scope: !13)
!22 = !DILocalVariable(name: "dataGoodBuffer", scope: !13, file: !14, line: 30, type: !4)
!23 = !DILocation(line: 30, column: 12, scope: !13)
!24 = !DILocation(line: 30, column: 37, scope: !13)
!25 = !DILocation(line: 31, column: 12, scope: !13)
!26 = !DILocation(line: 31, column: 5, scope: !13)
!27 = !DILocation(line: 32, column: 5, scope: !13)
!28 = !DILocation(line: 32, column: 25, scope: !13)
!29 = !DILocation(line: 33, column: 12, scope: !13)
!30 = !DILocation(line: 33, column: 5, scope: !13)
!31 = !DILocation(line: 34, column: 5, scope: !13)
!32 = !DILocation(line: 34, column: 27, scope: !13)
!33 = !DILocation(line: 36, column: 12, scope: !13)
!34 = !DILocation(line: 36, column: 10, scope: !13)
!35 = !DILocation(line: 37, column: 60, scope: !13)
!36 = !DILocation(line: 37, column: 5, scope: !13)
!37 = !DILocation(line: 38, column: 1, scope: !13)
!38 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_alloca_memcpy_53_good", scope: !14, file: !14, line: 62, type: !15, scopeLine: 63, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!39 = !DILocation(line: 64, column: 5, scope: !38)
!40 = !DILocation(line: 65, column: 1, scope: !38)
!41 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 77, type: !42, scopeLine: 78, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!42 = !DISubroutineType(types: !43)
!43 = !{!44, !44, !45}
!44 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!45 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!46 = !DILocalVariable(name: "argc", arg: 1, scope: !41, file: !14, line: 77, type: !44)
!47 = !DILocation(line: 77, column: 14, scope: !41)
!48 = !DILocalVariable(name: "argv", arg: 2, scope: !41, file: !14, line: 77, type: !45)
!49 = !DILocation(line: 77, column: 27, scope: !41)
!50 = !DILocation(line: 80, column: 22, scope: !41)
!51 = !DILocation(line: 80, column: 12, scope: !41)
!52 = !DILocation(line: 80, column: 5, scope: !41)
!53 = !DILocation(line: 82, column: 5, scope: !41)
!54 = !DILocation(line: 83, column: 5, scope: !41)
!55 = !DILocation(line: 84, column: 5, scope: !41)
!56 = !DILocation(line: 87, column: 5, scope: !41)
!57 = !DILocation(line: 88, column: 5, scope: !41)
!58 = !DILocation(line: 89, column: 5, scope: !41)
!59 = !DILocation(line: 91, column: 5, scope: !41)
!60 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 48, type: !15, scopeLine: 49, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!61 = !DILocalVariable(name: "data", scope: !60, file: !14, line: 50, type: !4)
!62 = !DILocation(line: 50, column: 12, scope: !60)
!63 = !DILocalVariable(name: "dataBadBuffer", scope: !60, file: !14, line: 51, type: !4)
!64 = !DILocation(line: 51, column: 12, scope: !60)
!65 = !DILocation(line: 51, column: 36, scope: !60)
!66 = !DILocalVariable(name: "dataGoodBuffer", scope: !60, file: !14, line: 52, type: !4)
!67 = !DILocation(line: 52, column: 12, scope: !60)
!68 = !DILocation(line: 52, column: 37, scope: !60)
!69 = !DILocation(line: 53, column: 12, scope: !60)
!70 = !DILocation(line: 53, column: 5, scope: !60)
!71 = !DILocation(line: 54, column: 5, scope: !60)
!72 = !DILocation(line: 54, column: 25, scope: !60)
!73 = !DILocation(line: 55, column: 12, scope: !60)
!74 = !DILocation(line: 55, column: 5, scope: !60)
!75 = !DILocation(line: 56, column: 5, scope: !60)
!76 = !DILocation(line: 56, column: 27, scope: !60)
!77 = !DILocation(line: 58, column: 12, scope: !60)
!78 = !DILocation(line: 58, column: 10, scope: !60)
!79 = !DILocation(line: 59, column: 64, scope: !60)
!80 = !DILocation(line: 59, column: 5, scope: !60)
!81 = !DILocation(line: 60, column: 1, scope: !60)
