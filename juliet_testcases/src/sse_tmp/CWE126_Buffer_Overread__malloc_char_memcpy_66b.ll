; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_memcpy_66b.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_memcpy_66b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_char_memcpy_66b_badSink(i8** %dataArray) #0 !dbg !9 {
entry:
  %dataArray.addr = alloca i8**, align 8
  %data = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  store i8** %dataArray, i8*** %dataArray.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %dataArray.addr, metadata !16, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  %0 = load i8**, i8*** %dataArray.addr, align 8, !dbg !20
  %arrayidx = getelementptr inbounds i8*, i8** %0, i64 2, !dbg !20
  %1 = load i8*, i8** %arrayidx, align 8, !dbg !20
  store i8* %1, i8** %data, align 8, !dbg !19
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !21, metadata !DIExpression()), !dbg !26
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !27
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !27
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !28
  store i8 0, i8* %arrayidx1, align 1, !dbg !29
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !30
  %2 = load i8*, i8** %data, align 8, !dbg !31
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !32
  %call = call i64 @strlen(i8* %arraydecay3) #7, !dbg !33
  %mul = mul i64 %call, 1, !dbg !34
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay2, i8* align 1 %2, i64 %mul, i1 false), !dbg !30
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !35
  store i8 0, i8* %arrayidx4, align 1, !dbg !36
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !37
  call void @printLine(i8* %arraydecay5), !dbg !38
  %3 = load i8*, i8** %data, align 8, !dbg !39
  call void @free(i8* %3) #8, !dbg !40
  ret void, !dbg !41
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

declare dso_local void @printLine(i8*) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #6

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_char_memcpy_66b_goodG2BSink(i8** %dataArray) #0 !dbg !42 {
entry:
  %dataArray.addr = alloca i8**, align 8
  %data = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  store i8** %dataArray, i8*** %dataArray.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %dataArray.addr, metadata !43, metadata !DIExpression()), !dbg !44
  call void @llvm.dbg.declare(metadata i8** %data, metadata !45, metadata !DIExpression()), !dbg !46
  %0 = load i8**, i8*** %dataArray.addr, align 8, !dbg !47
  %arrayidx = getelementptr inbounds i8*, i8** %0, i64 2, !dbg !47
  %1 = load i8*, i8** %arrayidx, align 8, !dbg !47
  store i8* %1, i8** %data, align 8, !dbg !46
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !48, metadata !DIExpression()), !dbg !50
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !51
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !51
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !52
  store i8 0, i8* %arrayidx1, align 1, !dbg !53
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !54
  %2 = load i8*, i8** %data, align 8, !dbg !55
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !56
  %call = call i64 @strlen(i8* %arraydecay3) #7, !dbg !57
  %mul = mul i64 %call, 1, !dbg !58
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay2, i8* align 1 %2, i64 %mul, i1 false), !dbg !54
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !59
  store i8 0, i8* %arrayidx4, align 1, !dbg !60
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !61
  call void @printLine(i8* %arraydecay5), !dbg !62
  %3 = load i8*, i8** %data, align 8, !dbg !63
  call void @free(i8* %3) #8, !dbg !64
  ret void, !dbg !65
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind readonly willreturn }
attributes #8 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_memcpy_66b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_char_memcpy_66b_badSink", scope: !10, file: !10, line: 23, type: !11, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_memcpy_66b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!15 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!16 = !DILocalVariable(name: "dataArray", arg: 1, scope: !9, file: !10, line: 23, type: !13)
!17 = !DILocation(line: 23, column: 68, scope: !9)
!18 = !DILocalVariable(name: "data", scope: !9, file: !10, line: 26, type: !14)
!19 = !DILocation(line: 26, column: 12, scope: !9)
!20 = !DILocation(line: 26, column: 19, scope: !9)
!21 = !DILocalVariable(name: "dest", scope: !22, file: !10, line: 28, type: !23)
!22 = distinct !DILexicalBlock(scope: !9, file: !10, line: 27, column: 5)
!23 = !DICompositeType(tag: DW_TAG_array_type, baseType: !15, size: 800, elements: !24)
!24 = !{!25}
!25 = !DISubrange(count: 100)
!26 = !DILocation(line: 28, column: 14, scope: !22)
!27 = !DILocation(line: 29, column: 9, scope: !22)
!28 = !DILocation(line: 30, column: 9, scope: !22)
!29 = !DILocation(line: 30, column: 21, scope: !22)
!30 = !DILocation(line: 33, column: 9, scope: !22)
!31 = !DILocation(line: 33, column: 22, scope: !22)
!32 = !DILocation(line: 33, column: 35, scope: !22)
!33 = !DILocation(line: 33, column: 28, scope: !22)
!34 = !DILocation(line: 33, column: 40, scope: !22)
!35 = !DILocation(line: 34, column: 9, scope: !22)
!36 = !DILocation(line: 34, column: 21, scope: !22)
!37 = !DILocation(line: 35, column: 19, scope: !22)
!38 = !DILocation(line: 35, column: 9, scope: !22)
!39 = !DILocation(line: 36, column: 14, scope: !22)
!40 = !DILocation(line: 36, column: 9, scope: !22)
!41 = !DILocation(line: 38, column: 1, scope: !9)
!42 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_char_memcpy_66b_goodG2BSink", scope: !10, file: !10, line: 45, type: !11, scopeLine: 46, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!43 = !DILocalVariable(name: "dataArray", arg: 1, scope: !42, file: !10, line: 45, type: !13)
!44 = !DILocation(line: 45, column: 72, scope: !42)
!45 = !DILocalVariable(name: "data", scope: !42, file: !10, line: 47, type: !14)
!46 = !DILocation(line: 47, column: 12, scope: !42)
!47 = !DILocation(line: 47, column: 19, scope: !42)
!48 = !DILocalVariable(name: "dest", scope: !49, file: !10, line: 49, type: !23)
!49 = distinct !DILexicalBlock(scope: !42, file: !10, line: 48, column: 5)
!50 = !DILocation(line: 49, column: 14, scope: !49)
!51 = !DILocation(line: 50, column: 9, scope: !49)
!52 = !DILocation(line: 51, column: 9, scope: !49)
!53 = !DILocation(line: 51, column: 21, scope: !49)
!54 = !DILocation(line: 54, column: 9, scope: !49)
!55 = !DILocation(line: 54, column: 22, scope: !49)
!56 = !DILocation(line: 54, column: 35, scope: !49)
!57 = !DILocation(line: 54, column: 28, scope: !49)
!58 = !DILocation(line: 54, column: 40, scope: !49)
!59 = !DILocation(line: 55, column: 9, scope: !49)
!60 = !DILocation(line: 55, column: 21, scope: !49)
!61 = !DILocation(line: 56, column: 19, scope: !49)
!62 = !DILocation(line: 56, column: 9, scope: !49)
!63 = !DILocation(line: 57, column: 14, scope: !49)
!64 = !DILocation(line: 57, column: 9, scope: !49)
!65 = !DILocation(line: 59, column: 1, scope: !42)
