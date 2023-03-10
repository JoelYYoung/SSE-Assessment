; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_memmove_61b.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_memmove_61b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local i8* @CWE127_Buffer_Underread__malloc_char_memmove_61b_badSource(i8* %data) #0 !dbg !13 {
entry:
  %data.addr = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !19, metadata !DIExpression()), !dbg !21
  %call = call noalias align 16 i8* @malloc(i64 100) #5, !dbg !22
  store i8* %call, i8** %dataBuffer, align 8, !dbg !21
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !23
  %cmp = icmp eq i8* %0, null, !dbg !25
  br i1 %cmp, label %if.then, label %if.end, !dbg !26

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !27
  unreachable, !dbg !27

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !29
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !30
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !31
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !31
  store i8 0, i8* %arrayidx, align 1, !dbg !32
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !33
  %add.ptr = getelementptr inbounds i8, i8* %3, i64 -8, !dbg !34
  store i8* %add.ptr, i8** %data.addr, align 8, !dbg !35
  %4 = load i8*, i8** %data.addr, align 8, !dbg !36
  ret i8* %4, !dbg !37
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: noinline nounwind uwtable
define dso_local i8* @CWE127_Buffer_Underread__malloc_char_memmove_61b_goodG2BSource(i8* %data) #0 !dbg !38 {
entry:
  %data.addr = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !39, metadata !DIExpression()), !dbg !40
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !41, metadata !DIExpression()), !dbg !43
  %call = call noalias align 16 i8* @malloc(i64 100) #5, !dbg !44
  store i8* %call, i8** %dataBuffer, align 8, !dbg !43
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !45
  %cmp = icmp eq i8* %0, null, !dbg !47
  br i1 %cmp, label %if.then, label %if.end, !dbg !48

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !49
  unreachable, !dbg !49

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !51
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !52
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !53
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !53
  store i8 0, i8* %arrayidx, align 1, !dbg !54
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !55
  store i8* %3, i8** %data.addr, align 8, !dbg !56
  %4 = load i8*, i8** %data.addr, align 8, !dbg !57
  ret i8* %4, !dbg !58
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_memmove_61b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"uwtable", i32 1}
!11 = !{i32 7, !"frame-pointer", i32 2}
!12 = !{!"clang version 13.0.0"}
!13 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_char_memmove_61b_badSource", scope: !14, file: !14, line: 23, type: !15, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_memmove_61b.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{!4, !4}
!17 = !DILocalVariable(name: "data", arg: 1, scope: !13, file: !14, line: 23, type: !4)
!18 = !DILocation(line: 23, column: 74, scope: !13)
!19 = !DILocalVariable(name: "dataBuffer", scope: !20, file: !14, line: 26, type: !4)
!20 = distinct !DILexicalBlock(scope: !13, file: !14, line: 25, column: 5)
!21 = !DILocation(line: 26, column: 16, scope: !20)
!22 = !DILocation(line: 26, column: 37, scope: !20)
!23 = !DILocation(line: 27, column: 13, scope: !24)
!24 = distinct !DILexicalBlock(scope: !20, file: !14, line: 27, column: 13)
!25 = !DILocation(line: 27, column: 24, scope: !24)
!26 = !DILocation(line: 27, column: 13, scope: !20)
!27 = !DILocation(line: 27, column: 34, scope: !28)
!28 = distinct !DILexicalBlock(scope: !24, file: !14, line: 27, column: 33)
!29 = !DILocation(line: 28, column: 16, scope: !20)
!30 = !DILocation(line: 28, column: 9, scope: !20)
!31 = !DILocation(line: 29, column: 9, scope: !20)
!32 = !DILocation(line: 29, column: 27, scope: !20)
!33 = !DILocation(line: 31, column: 16, scope: !20)
!34 = !DILocation(line: 31, column: 27, scope: !20)
!35 = !DILocation(line: 31, column: 14, scope: !20)
!36 = !DILocation(line: 33, column: 12, scope: !13)
!37 = !DILocation(line: 33, column: 5, scope: !13)
!38 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_char_memmove_61b_goodG2BSource", scope: !14, file: !14, line: 41, type: !15, scopeLine: 42, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!39 = !DILocalVariable(name: "data", arg: 1, scope: !38, file: !14, line: 41, type: !4)
!40 = !DILocation(line: 41, column: 78, scope: !38)
!41 = !DILocalVariable(name: "dataBuffer", scope: !42, file: !14, line: 44, type: !4)
!42 = distinct !DILexicalBlock(scope: !38, file: !14, line: 43, column: 5)
!43 = !DILocation(line: 44, column: 16, scope: !42)
!44 = !DILocation(line: 44, column: 37, scope: !42)
!45 = !DILocation(line: 45, column: 13, scope: !46)
!46 = distinct !DILexicalBlock(scope: !42, file: !14, line: 45, column: 13)
!47 = !DILocation(line: 45, column: 24, scope: !46)
!48 = !DILocation(line: 45, column: 13, scope: !42)
!49 = !DILocation(line: 45, column: 34, scope: !50)
!50 = distinct !DILexicalBlock(scope: !46, file: !14, line: 45, column: 33)
!51 = !DILocation(line: 46, column: 16, scope: !42)
!52 = !DILocation(line: 46, column: 9, scope: !42)
!53 = !DILocation(line: 47, column: 9, scope: !42)
!54 = !DILocation(line: 47, column: 27, scope: !42)
!55 = !DILocation(line: 49, column: 16, scope: !42)
!56 = !DILocation(line: 49, column: 14, scope: !42)
!57 = !DILocation(line: 51, column: 12, scope: !38)
!58 = !DILocation(line: 51, column: 5, scope: !38)
